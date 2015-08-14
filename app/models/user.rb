class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :congrats_email

  mount_uploader :avatar, AvatarUploader

  validates :firstname,:lastname,:contact,:position,:email,:address,:dob,:accessLevel, :password, :password_confirmation,presence: true


  def congrats_email
    UserMailer.welcome_email(self).deliver
  end
end
