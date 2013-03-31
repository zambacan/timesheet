require 'spec_helper'

describe "Client pages" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before do
    sign_in user
    visit clients_path 
  end
  describe "index search page" do

    # let(:client) { FactoryGirl.create(:client) }
    # before(:each) do

    it { should have_selector('title', text: 'All clients') }  
    it { should have_selector('h1', text: 'Clients') }  

    describe "pagination" do
      before(:all) { 31.times { FactoryGirl.create(:client) }}
      after(:all) { Client.delete_all }
      it {should have_selector('div.pagination') }
      it "should list each client" do
        Client.paginate(page: 1).each do |client|
          page.should have_selector('li', text: client.name)
          # visit client_path(Client.paginate(page: 1).first)
        end
      end


    end
  end
  describe "show client page" do
    before do
      @client = Client.create!(name: "Example",                         
      address: "124 Main Street",
      city:    "Spring Hill",
      postcode: "4004",
      state:  "QLD",
      phone:  "0712345678",
      default_billing_rate: "120",
      default_billing_unit: "hour")
      visit client_path @client
    end
    it {should have_selector("title", text: "Client details")}
     it {should have_selector("h1", text: @client.name)}
  end

end
