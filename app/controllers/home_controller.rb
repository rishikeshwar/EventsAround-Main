class HomeController < ApplicationController

	"This should skip the authorization which has been defined in application_controller.rb"
	skip_before_action :authorize
	
	def index
	end
end
