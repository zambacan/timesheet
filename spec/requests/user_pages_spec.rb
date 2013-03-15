require 'spec_helper'

describe "User Pages" do
  subject { page } 
  describe "signup page" do
    before { visit signup_path }
    it { should have_selector('h1', text: 'Sign up') }
    it { should have_selector('title', text: 'Swashfly Invoice System | Sign up') }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_selector('title', text: user.full_name ) }
    it { should have_selector('h1', text: user.full_name ) }
  end


  describe "signup" do
    before { visit signup_path }
    describe "with invalid information" do
      it "should not create a user" do
        expect {  click_button "Create my account"  }.not_to change(User, :count).by(1) 
      end
    end

    describe "with valid information" do
      before do
        fill_in "First name", with: "Toby"
        fill_in "Last name", with: "Maquire"
        fill_in "Email", with: "Toby@example.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      it "should create a user" do
        expect {  click_button "Create my account"  }.to change(User, :count).by(1) 
      end
    end

  end

end

