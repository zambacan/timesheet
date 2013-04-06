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

require 'spec_helper'

describe Client do
  let(:client) {FactoryGirl.create(:client) }
  subject { client }
  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:postcode) }
  it { should respond_to(:phone) }
  it { should respond_to(:default_billing_rate) }
  it { should respond_to(:default_billing_unit) }
  it { should respond_to(:contacts) }
  it { should be_valid }

  describe "when client name is missing" do
    before { client.name="" }
    it { should_not be_valid }
  end
  describe "when address is not supplied" do
    before { client.address="" }
    it { should_not be_valid }
  end
  describe "when postcode  is missing" do
    before { client.postcode="" }
    it { should_not be_valid }
  end
  describe "when city is not present" do
    before { client.city="" }
    it { should_not be_valid }
  end


end
