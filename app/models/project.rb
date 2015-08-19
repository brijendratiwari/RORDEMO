class Project < ActiveRecord::Base

  validates :name, :description, :start_date, :estimeted_end_date, :users_id ,presence: true

  belongs_to :user

end
