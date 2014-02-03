class UserMailer < ActionMailer::Base

  default from: 'andrew@generalassemb.ly'
 
  def welcome_user(user)
    @user = user
    @url  = 'http://mailing_app.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to Mailing App Demo!!!!')
  end

end