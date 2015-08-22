class Changecolumname < ActiveRecord::Migration
  def change
    rename_column :task_project_user_relations, :users_id, :user_id
  end
end
