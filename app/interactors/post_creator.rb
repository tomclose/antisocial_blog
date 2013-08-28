class PostCreator
  def initialize(subscriber)
    @subscriber = subscriber
  end


  def call(params)
    post = Post.new(params)

    if post.save
      @subscriber.post_saved(post)
    else
      @subscriber.post_save_failed(post)
    end

  end
end