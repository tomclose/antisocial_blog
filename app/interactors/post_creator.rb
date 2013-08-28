class PostCreator
  include SubscriberExtractor

  def initialize(subscribers = [])
    @subscribers = subscribers
  end


  def call(post_params, &blk)
    subscribers = @subscribers
    subscribers += extract_subscriber(&blk)

    post = Post.new(post_params)

    if post.save
      subscribers.each {|s| s.success(post)}
    else
      subscribers.each {|s| s.failure(post)}
    end

  end
end