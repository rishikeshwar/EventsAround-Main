class HomeController < ApplicationController

	"This should skip the authorization which has been defined in application_controller.rb"
	skip_before_action :authorize
	
	def index
		@hostevent=login_url
		if session[:user_id]!=nil
			@hostevent=new_user_event_path(session[:user_id])
		end
	end

	def contact 
		UserMailer.contact_email(params).deliver_now
		redirect_to root_url
	end
end
