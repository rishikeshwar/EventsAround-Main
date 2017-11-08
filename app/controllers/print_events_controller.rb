class PrintEventsController < ApplicationController
	skip_before_action :authorize, only: [:index ]
	def index 
		@totalevents = Event.all
		@hostevent=login_url
		if session[:user_id]!=nil
			@hostevent = user_events_path(session[:user_id])
		end
	
		#@user = User.new()
	end 
end
