class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :phone
      t.decimal :default_billing_rate
      t.string :default_billing_unit

      t.timestamps
    end
  end
end
