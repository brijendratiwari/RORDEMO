class Changetakscolumn < ActiveRecord::Migration
  def change
    rename_column :tasks, :created_by, :users_id
  end
end
