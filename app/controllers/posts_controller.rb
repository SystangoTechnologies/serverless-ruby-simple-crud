class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :delete]

  # GET /posts
  def index
    @posts = Post.all
    render json: {success: true, posts: @posts, status: 200}
  end

  # GET /posts/1
  def show
    render json: {sucess: true, post: @post, status: 200}
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: {success: true, message: "Post created", post: @post, status: 201}
    else
      render json: {success: false, mesasge: @post.errors.full_messages.join(", "), status: 422}
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: {success: false, mesasge: @post.errors.full_messages.join(", "), status: 422}
    end
  end

  # DELETE /posts/1
  def delete
    @post.destroy
    render json: {sucess: true, message: "Post deleted!", status: 200}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by_id(params[:id])
      if @post.nil?
        render json: {success: false, message: "No Post found corresponfing to the give ID", status: 200}
      end
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.fetch(:post, {}).permit(:title)
    end
end
