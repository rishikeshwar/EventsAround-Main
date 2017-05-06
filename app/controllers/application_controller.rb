class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorize 
  protected 
  def authorize 
  	unless User.find_by(id: session[:user_id])
  		redirect_to login_url, notice: "Dont even try to xD"
  	end
  end
end
