# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base

  protected
    # Returns the currently logged in user or Nil if there isn't one
    def current_user
      return unless session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id]) 
    end

    # Make current_user available in templates as a helper
    helper_method :current_user

    def logged_in?
      current_user.is_a? User
    end

    # Make logged_in? available in templates as a helper
    helper_method :logged_in?

    # Filter method to enforce a login requirement
    # Apply as a before_filter on any controller you want to protect
    def authenticate
      current_user ? true : access_denied
    end

    def access_denied
      flash[:notice] = "Please log in to continue"
      redirect_to login_url and return false
    end
end
