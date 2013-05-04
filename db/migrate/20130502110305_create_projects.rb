class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :project_description
      t.boolean :active
      t.integer :client_id

      t.timestamps
    end
  end
end
