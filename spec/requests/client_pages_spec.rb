require 'spec_helper'

describe "Client pages" do
  subject { page }
  describe "index search page" do

    # let(:client) { FactoryGirl.create(:client) }
    # before(:each) do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit clients_path 
    end
    it { should have_selector('title', text: 'All clients') }  
    it { should have_selector('h1', text: 'Clients') }  

    describe "pagination" do
      before(:all) { 31.times { FactoryGirl.create(:client) }}
      after(:all) { Client.delete_all }
      it {should have_selector('div.pagination') }
      it "should list each client" do
        Client.paginate(page: 1).each do |client|
          page.should have_selector('li', text: client.name)
        end
      end
    end
  end
end