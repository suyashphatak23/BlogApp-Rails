class ApplicationController < ActionController::Base
    def home
        redirect_to articles_path if logged_in?
    end

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end
end
