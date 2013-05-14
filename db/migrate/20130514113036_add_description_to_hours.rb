class AddDescriptionToHours < ActiveRecord::Migration
  def change
    add_column :hours, :description, :string
  end
end
