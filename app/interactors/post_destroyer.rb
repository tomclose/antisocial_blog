class PostDestroyer
  def initialize()
  end

  def call(params)
    Post.find_by_id(params[:id]).destroy

  end
end