class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  before_action :authorize 




  "This method is defined so as to not allow people to directly access certain pages
  by directly altering the url instead of pressing buttons to navigate"
  protected 
  def authorize 
  	unless User.find_by(id: session[:user_id])
  		redirect_to login_url, notice: "Dont even try to xD"
  	end
  end

  
end
