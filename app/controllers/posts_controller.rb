class PostsController < ApplicationController
  before_action :set_store
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = PostLister.new(@store).call
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    respond_to do |format|
      PostCreator.new(@store).call(post_params) do |result|
        result.success do |post|
          format.html { redirect_to post, notice: 'Post was successfully created.' }
          format.json { render action: 'show', status: :created, location: post }
        end
        result.failure do |post|
          format.html { @post = post; render action: 'new' }
          format.json { render json: post.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      PostUpdater.new(@store).call(post_params.merge(id:params[:id])) do |result|
        result.success do |post|
          format.html { redirect_to post, notice: 'Post was successfully updated.' }
          format.json { head :no_content }
        end
        result.failure do |post|
          format.html { @post = post; render action: 'edit' }
          format.json { render json: post.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    PostDestroyer.new(@store).call(params)
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    def set_store
      @store = ARStore.new
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = PostFinder.new(@store).call(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :date, :body)
    end
end
