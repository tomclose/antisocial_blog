class PostLister
  def initialize(store)
    @store = store
  end
  def call
    @store.all_posts
  end

end