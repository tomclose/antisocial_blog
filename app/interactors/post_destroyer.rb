class PostDestroyer
  def initialize(store)
    @store = store
  end

  def call(params)
    @store.destroy_post
  end
end