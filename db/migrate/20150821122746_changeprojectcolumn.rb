class Changeprojectcolumn < ActiveRecord::Migration
  def change
    rename_column :projects, :created_by, :users_id
  end
end
