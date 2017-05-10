class SessionsController < ApplicationController
	skip_before_action :authorize
  def new
  	@have = User.find_by(id: session[:user_id])
  end
  

  def create
  	@user = User.find_by(name: params[:name])
  	if @user and @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to @user
  	else 
  		redirect_to login_url, alert:"Invalid Username or Password"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, alert: "Successfull"
  end
end
