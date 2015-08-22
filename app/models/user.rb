class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :project_user_relations, foreign_key: "users_id", :dependent => :delete_all
  has_many :projects, :through => :project_user_relations



  has_many :task_project_user_relations, foreign_key: "users_id", :dependent => :delete_all
  has_many :tasks, :through => :task_project_user_relations

  accepts_nested_attributes_for :projects
  accepts_nested_attributes_for :tasks

  belongs_to :project
  belongs_to :task


  after_create :congrats_email

  mount_uploader :avatar, AvatarUploader

  validates :firstname,:lastname,:contact,:position,:email,:address,:dob,:accessLevel, :password, :password_confirmation,:skills,presence: true


  def congrats_email
    UserMailer.welcome_email(self).deliver
  end
end
