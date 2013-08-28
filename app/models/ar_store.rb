class ARStore
    include SubscriberExtractor
  def all_posts
    ARPost.all.map {|x| postify(x)}
  end

  def find_post(id)
    postify(ARPost.find(id))
  end

  def create_post(params, &blk)
    subscribers = [] + extract_subscriber(&blk)
    p = ARPost.new(params)
    success = p.save
    p = postify(p)

    subscribers.each {|s| success ? s.success(p) : s.failure(p) }
  end

  def update_post(params)
    subscribers = [] + extract_subscriber(&blk)
    p =  ARPost.find_by_id(params[:id])
    success = p.update(params)
    p = postify(p)

    subscribers.each {|s| success ? s.success(p) : s.failure(p) }
  end

  def destroy_post(id)
    ARPost.find_by_id(id).destroy
  end

  private
  def postify(ar_post)
    p = Post.new
    # stupid way to do this:
    p.id = ar_post.id
    p.title = ar_post.title
    p.body = ar_post.body
    p.date = ar_post.date
    if ar_post.errors
      p.errors = ar_post.errors.messages
    end
    p
  end

end