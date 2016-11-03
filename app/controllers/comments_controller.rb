class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to users_path(params[:user_id]), success: "Comment posted!"
    else
      redirect_to users_path(params[:user_id])
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_path(current_user.id)
    flash[:success] = "Comment Deleted!"
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
