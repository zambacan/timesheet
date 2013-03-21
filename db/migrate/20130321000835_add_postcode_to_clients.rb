class AddPostcodeToClients < ActiveRecord::Migration
  def change
    add_column :clients, :postcode, :string
  end
end
