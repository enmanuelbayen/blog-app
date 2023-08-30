class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).includes(:comments, :author)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = Comment.where(post_id: params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      flash.now[:error] = 'Failed to create the post.'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.decrement_posts_counter
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
