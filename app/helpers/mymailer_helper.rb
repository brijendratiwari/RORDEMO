module MymailerHelper

  def send_email(from = 'support@mail.com', to , subject , message)

    mail = Mail.new do
      from     from
      to       to
      subject  subject
      body     message
    end

    mail.deliver!
  end

end
