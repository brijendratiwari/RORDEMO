class CreateProjectUserRelations < ActiveRecord::Migration
  def change
    create_table :project_user_relations do |t|
      t.integer :projects_id
      t.integer :users_id

      t.timestamps null: false
    end
  end
end
