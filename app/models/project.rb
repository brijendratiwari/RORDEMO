class Project < ActiveRecord::Base

  validates :name, :description, :start_date, :estimeted_end_date ,presence: true

  has_many :project_user_relations, foreign_key: "projects_id", :dependent => :delete_all
  has_many :users, :through => :project_user_relations
  accepts_nested_attributes_for :users

  has_one :user,foreign_key: "id",:primary_key => :users_id
end
