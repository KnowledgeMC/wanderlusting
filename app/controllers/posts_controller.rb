class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_path(current_user.id)
      flash[:success] = "Post Created!"
    else
      redirect_to new_post_path
    end
  end

  def show
    # @user = User.find(params[:id])
    # @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to user_path(current_user.id)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user.id)
    flash[:success] = "Post Deleted!"
  end

  private
    def post_params
      params.require(:post).permit(:picture, :caption)
    end
end
