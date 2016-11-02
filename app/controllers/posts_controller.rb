class PostsController < ApplicationController

  def new

  end

  def create
    @post = Post.create(post_params)

  end

  def show

  end

  private
    def post_params
      params.require(:post).permit(:picture, :caption)
end
