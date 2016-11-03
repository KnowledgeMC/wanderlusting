class PagesController < ApplicationController
  def home
    @post = current_user.posts.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end

end
