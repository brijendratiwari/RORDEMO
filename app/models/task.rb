class Task < ActiveRecord::Base

  has_many :task_project_user_relations, foreign_key: "task_id", :dependent => :delete_all
  has_many :user, :through => :task_project_user_relations
  accepts_nested_attributes_for :user

  has_one :users,:class_name => "User",foreign_key: "id",:primary_key => :users_id
end
