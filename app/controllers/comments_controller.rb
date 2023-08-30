class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to user_post_path(params[:user_id], params[:post_id]), notice: 'Comment was successfully created.'
    else
      flash.now[:error] = 'Failed to create the comment.'
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      @comment.decrement_comments_counter
      redirect_to user_post_path(id: params.require(:post_id), user_id: params.require(:user_id)), status: :see_other
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(author_id: current_user.id, post_id: params[:post_id])
  end
end
