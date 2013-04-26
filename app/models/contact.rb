# == Schema Information
#
# Table name: contacts
#
#  id              :integer          not null, primary key
#  client_id       :integer
#  first_name      :string(255)
#  last_name       :string(255)
#  phone           :string(255)
#  email           :string(255)
#  invoice_contact :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Contact < ActiveRecord::Base
  attr_accessible  :email, :first_name, :invoice_contact, :last_name, :phone
  # validates :client_id, presence: true
  validates :first_name, presence: true, length: { maximum: 50}
  validates :last_name, presence: true, length: { maximum: 50}
  belongs_to :client
  
  def full_name
     return "#{first_name} #{last_name}"
   end
end
