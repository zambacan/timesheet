# == Schema Information
#
# Table name: clients
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  address              :string(255)
#  city                 :string(255)
#  state                :string(255)
#  phone                :string(255)
#  default_billing_rate :decimal(, )
#  default_billing_unit :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  postcode             :string(255)
#

class Client < ActiveRecord::Base
  default_scope  order('name ASC')
  attr_accessible :address, :city, :default_billing_rate, :default_billing_unit, :name, :phone, :state, :postcode, :contacts_attributes
  has_many :contacts
  accepts_nested_attributes_for :contacts
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :address, presence: true, length: { maximum: 50 }
  validates :city, presence: true, length: { maximum: 50 }
  validates :postcode, presence: true, length: { maximum: 10 }
  validates :state, presence: true, length: { maximum: 20 }

  # VALID_PHONE_REGEX = ^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$
  # i need to think about validation of phone numbers, but this introduces the much broader question
  # of support for other countries and how am i going to achieve this...
  # i definiately need to allow the user to enter clients and do business with clients that are outside their own country
  # a kiwi might work for an aussie or vice versa
  # an american might have a canadiance client
  # england scotland and wales are almost like one country
  # i am not going to worry about not english speaking countries.
  validates :phone, presence: true, length: { maximum: 30 }
  # validates :default_billing_rate
  # validates :default_billing_unit, presence: true

  def self.search(search)
    if search
      where('name ILIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end


