class AddSkiilToUsers < ActiveRecord::Migration
  def change
    add_column :users, :skills, :string
  end
end
