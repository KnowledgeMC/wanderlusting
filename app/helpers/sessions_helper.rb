module SessionsHelper

  #logs in the user
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authenticate
    unless logged_in?
      flash[:alert] = "You must be logged in!"
      redirect_to login_url
    end
  end
end
