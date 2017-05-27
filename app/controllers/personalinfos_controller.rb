class PersonalinfosController < ApplicationController

	def index 
		@user = User.find(session[:user_id])
		@personalinfo = Personalinfo.new
		render :index
	end

	def new
		puts "atleast new is being called"
    	@personalinfo = Personalinfo.new
  	end

  	def show 

  	end

  	"This method is called from personalinfo controller index.html.erb. What happens exactly is
  	the user enters all their personal details and when the update button is pressed first it is
  	checked if it already exists and that is taken care by the first if condition. If it exists
  	then update it else a new one is created but everytime the validations are checked and notices
  	are flashed, then if everything is satisfied it is redirected to that same page with the updated
  	information seen on the top"
	def create 
		@user = User.find(session[:user_id])
		@personalinfo = Personalinfo.new(personalinfo_params)
		if Personalinfo.exists?(user_id: @personalinfo.user_id)
			a = Personalinfo.find_by_user_id(session[:user_id])
			a.update(personalinfo_params)
			if a.save
			else 
				flash[:notice] = a.errors.messages
			end
		else 
			if @personalinfo.save
			else 
				flash[:notice] = @personalinfo.errors.messages
			end
		end
		redirect_to user_personalinfos_path
	end

	"This method personalinfo_params is called from create method"
	def personalinfo_params 
		params.permit(:id, :user_id, :name, :phoneno)
	end

end
