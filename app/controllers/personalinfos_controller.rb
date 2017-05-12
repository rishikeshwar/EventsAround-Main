class PersonalinfosController < ApplicationController

	def index 
		@user = User.find(session[:user_id])
		render :index
	end

	def new
    	@personalinfo = Personalinfo.new
  	end

  	def show 

  	end

	def create 
		@user = User.find(session[:user_id])
		@personalinfo = Personalinfo.new(personalinfo_params)
		if Personalinfo.exists?(user_id: @personalinfo.user_id)
			a = Personalinfo.find_by_user_id(session[:user_id])
			a.update(personalinfo_params)
			a.save
		else 
			@personalinfo.save
		end
		redirect_to user_path(@user)
		puts "coming"
	end

	def personalinfo_params 
		params.permit(:id, :user_id, :name, :phoneno, :emailid)
	end

end
