class AddCretedbyToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :created_by, :integer
  end
end
