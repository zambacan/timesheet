class AddIndexToContactsClientId < ActiveRecord::Migration
  def change
    add_index :contacts, [:client_id, :created_at]
  end
end
