class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname,:lastname,:contact,:position,:email,:address,:dob, :password, :password_confirmation,presence: true
  after_create :congrats_email

  def congrats_email
    UserMailer.welcome_email(self).deliver
  end
end
