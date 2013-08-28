class PostUpdater
  include SubscriberExtractor

  def initialize(subscribers = [])
    @subscribers = subscribers
  end

  def call(post_params, &block)
    subscribers = @subscribers
    subscribers += extract_subscriber(&block)

    post = PostFinder.new().call(post_params[:id])

    result = post.update(post_params)

    subscribers.each {|s| result ? s.success(post) : s.failure(post)}
  end
end