module ApplicationHelper
  def is_login?
    session[:event_code] && EventSession.find_by_code(session[:event_code]).present?
  end

  def current_user
  session[:current_user]
  end
end
