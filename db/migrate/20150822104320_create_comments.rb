class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comments
      t.integer :task_id
      t.integer :users_id

      t.timestamps null: false
    end
  end
end
