class EventsController < ApplicationController


	def index
    	@events = Event.where("user_id =?", session[:user_id] )
      @user = User.find(session[:user_id])
     # puts "#{@events.ids}"

	end


	def new
    @event = Event.new
  end

  def show

  end

  def update
    @event = Event.find(params[:id])
    @start_date = Date.civil(params[:range1][:"startdate(1i)"].to_i, params[:range1][:"startdate(2i)"].to_i, params[:range1][:"startdate(3i)"].to_i)
    @end_date = Date.civil(params[:range2][:"enddate(1i)"].to_i, params[:range2][:"enddate(2i)"].to_i, params[:range2][:"enddate(3i)"].to_i)
    print "coming coming coming coming coming coming coming "
    print "#{@start_date}"
    print "#{@end_date}"
    event_params[:startdate] = @start_date
    event_params[:enddate] = @end_date
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to  user_events_path, notice: 'Event was successfully edited.' }
        #format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
   
  end

  	def create
  		puts "coming"
      @event=Event.new(event_params)
      @event.user_id = session[:user_id]
      @start_date = Date.civil(params[:range1][:"startdate(1i)"].to_i, params[:range1][:"startdate(2i)"].to_i, params[:range1][:"startdate(3i)"].to_i)
      @end_date = Date.civil(params[:range2][:"enddate(1i)"].to_i, params[:range2][:"enddate(2i)"].to_i, params[:range2][:"enddate(3i)"].to_i)
    
      @event.startdate=@start_date
      @event.enddate=@end_date
  		if Event.exists?(name: @event.name)
      		redirect_to new_user_event_path , alert: "Event already Exists"
      		return
  		end

  		unless @event.save
        	flash[:notice] = @event.errors.messages
        	redirect_to new_user_event_path
      	end
        redirect_to user_events_path
  	end

  def destroy
      
    @event=Event.find(params[:id])
    @event.destroy
     respond_to do |format|
      format.html { redirect_to user_events_path, notice: 'Event was successfully deleted.' }
      format.js
     end
    
  end


	def edit
    @user=User.find(session[:user_id])
		@event=Event.find(params[:id])

	end


  	def event_params
      params.permit(:id, :user_id, :name, :venue, :information, :festwebsite, :fblink, :festtype, :startdate, :enddate, :email1, :email2, :phone1, :phone2, :fee)
    end
end