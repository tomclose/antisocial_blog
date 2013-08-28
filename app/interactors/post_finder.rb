class PostFinder
  def initialize(store)
    @store = store
  end
  def call(id)
    @store.find_post(id)
  end
end