class UserMailer < ApplicationMailer
  default from: 'eventsaroundu@gmail.com'


  "This is to send the welcome email to the designated user with the information of their emailid and
  password that we generated. Called when a new user signsup or through gmail or FB based on thier mode of
  authentication"
  def welcome_email(user, inipassword)
    @user = user
    @inipassword = inipassword
    @url  = 'thebestapp12.herokuapp.com/login'
    mail(to: @user.name, subject: 'Welcome to EventsAround', template_name: "welcome_email")
  end

  "This is to send the updateion email to the user specifying thier password and emailid that has been updated"
  def update_email(user, newpass)
  	@user = user
  	@newpass = newpass
  	len = @newpass.length
  	@newpass.each_char.with_index do |char, index| 
  		if index != 0 and len != index+1 
  			@newpass[index] = '*'
  		end
  	end
  	@url = 'thebestapp12.herokuapp.com/login'
  	mail(to: @user.name, subject: 'Attention !!! Password Updated', template_name: "update_email")
  end

  def contact_email(names, email, phone, message) 
    @name = names
    @email = email
    @phone = phone
    @message = message
    mail(from: email to: 'eventsaroundu@gmail.com', subject: 'Contacting from EventsAround', template_name: "contact_email")
  end
end
