class Api::V1::PostsController < Api::V1::ApplicationController
  before_action :set_post, only: %i[show update destroy]

  def index
    @posts = Post.where(author_id: params[:user_id])

    render json: @posts, only: %i[title text]
  end

  def show
    render json: @post
  end

  def create
    @post = Post.find(params[:id])

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE
  def destroy
    @post.destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:text)
  end
end
