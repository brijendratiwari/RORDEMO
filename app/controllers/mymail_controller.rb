class MymailController < ApplicationController
  def show

    @settingsmtp = Settingsmtp.where('user_id = ?',current_user.id)

    email = @settingsmtp[0].user_name
    password = @settingsmtp[0].password
   mail = Mail.defaults do
     retriever_method :pop3, :address    => "mail.ignisitsolutions.com",
                      :port       => 110,
                      :user_name  => email,
                      :password   => password,
                      :enable_ssl => false
   end
   @emails = Mail.find(:what => :first, :count => 10, :order => :asc)

  end

  def composemail

  end

end
