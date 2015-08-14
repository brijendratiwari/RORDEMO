class TestController < ApplicationController
  def show

   # mail = Mail.defaults do
    #  retriever_method :pop3, :address    => "mail.ignisitsolutions.com",
   #                    :port       => 110,
    #                   :user_name  => 'ankit@ignisitsolutions.com',
     #                  :password   => 'ankit12345',
     #                  :enable_ssl => false
   # end
    @user = User.find(1)
    @message = "test"
    @email = "ankit@ignisitsolutions.com"
    UserMailer.welcome_email(@user).deliver

    byebug
  end
end
