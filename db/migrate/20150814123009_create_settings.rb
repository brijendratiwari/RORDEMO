class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :hostaddress
      t.integer :port
      t.string :user_name
      t.string :password
      t.string :enable_ssl

      t.timestamps null: false
    end
  end
end
