class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :delete]

  # GET /posts
  def index
    @posts = Post.all
    render json: @posts, status: 200
  end

  # GET /posts/1
  def show
    render json: @post, status: 200
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      set_header("Location", ENV['API_ENDPOINT']+"/posts/#{@post.id}")      
      render json: {id: @post.id}, status: 201
    else
      render json: {mesasge: @post.errors.full_messages.join(", ")}, status: 422
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: {}, status: 204
    else
      render json: {mesasge: @post.errors.full_messages.join(", ")}, status: 422
    end
  end

  # DELETE /posts/1
  def delete
    @post.destroy
    render json: {}, status: 204
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find_by_id(params[:id])
    render json: {}, status: 404 if @post.nil?
  end

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.fetch(:post, {}).permit(:title)
  end
end
