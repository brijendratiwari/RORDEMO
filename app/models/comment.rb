class Comment < ActiveRecord::Base

  has_one :users,:class_name => "User",foreign_key: "id",:primary_key => :users_id

end
