class PostCreator
  include SubscriberExtractor

  def initialize(store, subscribers = [])
    @store = store
    @subscribers = subscribers
  end


  def call(post_params, &blk)
    subscribers = @subscribers
    subscribers += extract_subscriber(&blk)

    @store.create_post(post_params) do |result|
      result.success {|post| subscribers.each {|s| s.success(post) }}
      result.failure {|post| subscribers.each {|s| s.failure(post) }}
    end

  end
end