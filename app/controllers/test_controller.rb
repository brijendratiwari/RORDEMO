class TestController < ApplicationController
  def show

   mail = Mail.defaults do
     retriever_method :pop3, :address    => "mail.ignisitsolutions.com",
                      :port       => 110,
                      :user_name  => 'ankit@ignisitsolutions.com',
                      :password   => 'ankit12345',
                      :enable_ssl => false
   end
byebug
   @emails = Mail.find(:what => :first, :count => 10, :order => :asc)

  end

end
