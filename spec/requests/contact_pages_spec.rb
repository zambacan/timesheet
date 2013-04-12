require 'spec_helper'

describe "ContactPages" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  describe 'contact creation' do
    before do 
      visit clients_path 
      click_link "New contact"
    end
    describe "with invalid information" do
      # e.g. clicking the add contact button without entering any info
      it "should not create a contact" do
        expect { click_button "Add contact" }.not_to change(Contact, :count)
      end
      describe "error messages" do
        before { click_button "Add contact"}
        it { should have_content("error") }
      end
    end  
      describe "with valid information" do
        # e.g. clicking the add contact button without entering any info
        before do
        fill_in "first name", with: "Harold"
        fill_in "Last name", with: "Holt"
        fill_in "Email", with: "harry@pm.com"
        fill_in "Phone", with: "0403 111 222"
        
        
        end
        it "should create a contact" do
          expect { click_button "Add contact" }.to change(Contact, :count).by(1)
        end
        describe "Alert" do
          before { click_button "Add contact"}
          it { should have_content("success") }
        end
      end
    end
  end
