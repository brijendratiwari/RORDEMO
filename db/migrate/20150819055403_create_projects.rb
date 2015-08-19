class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :estimeted_end_date
      t.integer :users_id

      t.timestamps null: false
    end
  end
end
