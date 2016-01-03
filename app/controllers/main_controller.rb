class MainController < ApplicationController
  def index
    redirect_to questions_path if get_event_session
  end

  def login
    event_code=params[:event_code]
    event_session=EventSession.find_by_code(event_code)
    redirect_to :root,:flash=> {:error=>"There is no active event for provided code"} and return unless event_session
    session[:event_code]=event_code
    redirect_to questions_path
  end

  def logout
    session[:event_code]=nil
    redirect_to :root
  end

end