class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.integer :project_id
      t.date :performed_on
      t.time :start_time
      t.time :finish_time
      t.decimal :billable_unit_quantity
      t.string :activity_type
      t.string :billing_status, default: 'unbilled'
      t.integer :user_id
      t.decimal :billing_rate
      t.string :billing_unit, default: 'hours'

      t.timestamps
    end
  end
end
