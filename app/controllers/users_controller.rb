class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  "This should skip the authorization which has been defined in application_controller.rb"
  skip_before_action :authorize, only: [:new, :create, :index]

  # GET /users
  # GET /users.json

  "This is the page which displays all the users with thier access. This is highly secured and
  confidential anyone entering this can control the 5 elements the universe and everthing that they
  see inside this program. Lets get to the technical part first it checks if they are using proper 
  credentials then if the name is ************ then he can do whatevr he wants else it sends them to the
  main page stating an alert"
  def index
    @users = User.all()
    @have = nil
    if session[:user_id] != nil
      @have = User.find(session[:user_id])
      if @have.name == "rishikeshwar1@gmail.com" and @have != nil
        render :index
        return
      else 
        redirect_to login_path, alert: "You should be logged in as Admin"
      end
   else 
    redirect_to login_path, alert: "You should be logged in as Admin"
  end
 end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json

  "Whenever it reaches 3000/users/new this method will be called if the entered usrname is already taken
  then an alert is flashed. If everthing passes the credentials are saved. While saving it is again 
  validated and errors are flashed through flash[:notices] and rendered according to that" 
  def create
    session[:user_id] = nil
    @user = User.new(user_params)

    "This part is to create a random password to be sent to a newly signed up User"
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    string = (0...10).map { o[rand(o.length)] }.join
    @inipassword = string
    @user.password = string
    @user.password_confirmation = string

    if User.exists?(name: @user.name)
      redirect_to new_user_path , alert: "EmailId already Exists"
      return 
    else 
      puts "NO"
    end


    respond_to do |format|
      if @user.save

        UserMailer.welcome_email(@user, @inipassword).deliver_now
        format.html { redirect_to @user, notice: 'User was successfully created and validated' }
        format.json { render :show, status: :created, location: @user }
        session[:user_id] = @user.id
      else
        flash[:notice] = @user.errors.messages
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json

  "This is used to update the username and password"
  def update
    respond_to do |format|
      if @user.update(user_params)
        UserMailer.update_email(@user, @user.password).deliver_now
        format.html { redirect_to login_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
