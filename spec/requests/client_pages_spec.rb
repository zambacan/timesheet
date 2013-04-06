require 'spec_helper'

describe "Client pages" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before do
    sign_in user
    visit clients_path 
    current_path.should == clients_path
  end
  describe "index search page" do

    it { should have_selector('title', text: 'All clients') }  
    it { should have_selector('h1', text: 'Clients') }  

    describe "pagination" do
      before(:all) { 31.times { FactoryGirl.create(:client) }}
      after(:all) { Client.delete_all }
      it {should have_link(Client.first.name, href: client_path(Client.first) )}
      it {should have_selector('div.pagination') }
      it "should list each client" do
        Client.paginate(page: 1).each do |client|
          page.should have_selector('li', text: client.name) 

        end
      end
    end
    describe "show all client details" do
      let(:client) { FactoryGirl.create(:client) }
      let!(:contact1) { FactoryGirl.create(:contact, client: client, first_name: "Toby", last_name: "Macquire") }
      let!(:contact2) { FactoryGirl.create(:contact, client: client, first_name: "Tom", last_name: "Jones") }

      before   { visit client_path(client) }

      describe "show client detail" do

        it { should have_selector('h1', text: client.name) }  
        it { should have_selector('li.active', text: 'Details') }  
        it { should_not have_selector('li.active', text: 'Contacts') }  
        it { should have_content(client.address) }  
                it { should have_selector("table") }  
                it { should have_content("Email") }
                it { should have_content(contact1.full_name) }
                it { should have_content(contact2.full_name) }
# the following doesnt work...i assume it is because it all happens after the page has loaded
# and its just javascript changing the page on the client
        # describe "contact details" do
        #          before { click_link "Contacts"}
        #          it { should_not have_selector('li.active', text: 'Details') }  
        #          it { should have_selector('li.active', text: 'Contacts') }  
        # 
        #         end
        

      end

    end
  end


end
