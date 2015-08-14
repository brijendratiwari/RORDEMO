class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :dob, :date
    add_column :users, :position, :string
    add_column :users, :contact, :string
    add_column :users, :address, :text
  end
end
