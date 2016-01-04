class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def get_event_session
    session[:event_code] && EventSession.find_by_code(session[:event_code])
  end

def require_login
    redirect_to login_users_path('', :redirect_url=>request.path) ,flash=>{:error=>"Please login first to access this page"} unless  current_user
end

def current_user
session[:current_user]
end

def logout_user
	session[:current_user]=nil
end	

end
