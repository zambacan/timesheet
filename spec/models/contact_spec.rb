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

require 'spec_helper'

describe Contact do
  let(:client) { FactoryGirl.create(:client) }
  before do
    @contact = client.contacts.build(first_name: "Raife", last_name: "stokes")
  end
  subject { @contact }
  it { should respond_to(:first_name) }
  it { should respond_to(:client_id) }
  it { should respond_to(:client) }
  its(:client) { should == client} 
  it { should be_valid }
  describe "without a client_id" do
    before { @contact.client_id=nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to client_id" do
      expect do
        Contact.new(client_id: client.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
  
  describe "with blank first_name" do
    before { @contact.first_name = "  "}
    it { should_not be_valid }
  end
  describe "with blank last_name" do
    before { @contact.last_name = "  "}
    it { should_not be_valid }
  end
  
  describe "with too long first_name" do
    before { @contact.first_name = "a" * 51}
    it { should_not be_valid }
  end
  describe "with too long last_name" do
    before { @contact.last_name = "b" * 51}
    it { should_not be_valid }
  end
end

