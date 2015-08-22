class Removecolumn < ActiveRecord::Migration
  def change

    remove_column :task_project_user_relations, :project_id

  end
end
