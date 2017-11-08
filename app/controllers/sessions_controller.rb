class SessionsController < ApplicationController

  "This should skip the authorization which has been defined in application_controller.rb"
	skip_before_action :authorize

  "This defines a new session based on the current id that is stored inside session[:user_id]"
  def new
  	@have = User.find_by(id: session[:user_id])
  end 
  
  "This method is called when a new user wants to login first it checks if the user exists by the provided
  name if not the page is again redirect else it goes inside the user authentication is also taken care of"
  def create
  	@user = User.find_by(name: params[:name])
  	if @user and @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to root_url
  	else 
  		redirect_to login_url, alert:"Invalid Username or Password"
  	end
  end


  "This method is called to delete all the paths that was assigned to that particular user_id stored in as
  session[:user_id]"
  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, alert: "Successfull"
  end

   def creategoogle
    puts "comingpleasecoming"
    user = User.from_omniauth(env["omniauth.auth"])
    
    localuser = User.find_by(name: user.name)
    session[:user_id] = localuser.id
    redirect_to root_path
  end

  def destroygoogle
    session[:user_id] = nil
    redirect_to root_path
  end
end
