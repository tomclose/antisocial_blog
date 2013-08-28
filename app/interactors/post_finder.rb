class PostFinder
  def call(id)
    Post.find(id)
  end
end