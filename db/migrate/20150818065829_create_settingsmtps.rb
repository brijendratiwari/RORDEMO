class CreateSettingsmtps < ActiveRecord::Migration
  def change
    create_table :settingsmtps do |t|
      t.string :hostaddress
      t.string :post
      t.string :user_name
      t.string :password
      t.string :enable_ssl
      t.string :protocol
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
