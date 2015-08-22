class CreateTaskProjectUserRelations < ActiveRecord::Migration
  def change
    create_table :task_project_user_relations do |t|
      t.integer :task_id
      t.integer :project_id
      t.integer :users_id

      t.timestamps null: false
    end
  end
end
