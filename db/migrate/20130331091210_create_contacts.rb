class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :client_id
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.boolean :invoice_contact, default: false

      t.timestamps
    end
  end
end
