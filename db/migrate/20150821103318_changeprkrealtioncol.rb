class Changeprkrealtioncol < ActiveRecord::Migration
  def change
    rename_column :project_user_relations, :users_id, :user_id
  end
end
