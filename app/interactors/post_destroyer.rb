class PostDestroyer
  def initialize(store)
    @store = store
  end

  def call(id)
    @store.destroy_post(id)
  end
end