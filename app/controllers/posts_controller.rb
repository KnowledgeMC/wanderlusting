class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_path(current_user.id)
    else
      redirect_to new_post_path
    end
  end

  def show

  end

  def destroy

  end

  private
    def post_params
      params.require(:post).permit(:picture, :caption)
    end
end
