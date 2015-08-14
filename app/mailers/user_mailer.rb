class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(from: 'notifications@example.com',to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
