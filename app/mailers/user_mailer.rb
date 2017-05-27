class UserMailer < ApplicationMailer
	default from: 'rishikeshwar1@gmail.com'
 
  def welcome_email(user, inipassword)
    @user = user
    @inipassword = inipassword
    @url  = 'thebestapp12.herokuapp.com/login'
    mail(to: @user.name, subject: 'Welcome to our Awesome Site')
  end
end
