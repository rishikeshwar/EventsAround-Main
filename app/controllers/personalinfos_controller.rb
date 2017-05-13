class PersonalinfosController < ApplicationController

	def index 
		@user = User.find(session[:user_id])
		render :index
	end

	def new
		puts "atleast new is being called"
    	@personalinfo = Personalinfo.new
  	end

  	def show 

  	end

	def create 
		puts "This is being called and thats it you are pro"
		@user = User.find(session[:user_id])
		@personalinfo = Personalinfo.new(personalinfo_params)
		if Personalinfo.exists?(user_id: @personalinfo.user_id)
			a = Personalinfo.find_by_user_id(session[:user_id])
			a.update(personalinfo_params)
			a.save
		else 
			@personalinfo.save
		end
		redirect_to user_personalinfos_path
		puts "coming"
	end

	def personalinfo_params 
		params.permit(:id, :user_id, :name, :phoneno, :emailid)
	end

end
