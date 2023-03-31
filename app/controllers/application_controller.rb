class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def home
    if logged_in?
      redirect_to article_path
    else
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    return if logged_in?

    flash[:alert] = 'You must be logged in to perform this action.'
    redirect_to login_path
  end
end
