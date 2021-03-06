class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :authenticate_user
  
  def home
  end
  
  private
  
  def current_user
    @current_user ||= Distributor.find_by(id: session[:distributor_id]) if session[:distributor_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def authenticate_user
    if !logged_in?
      redirect_to root_path
    end
  end
  
end
