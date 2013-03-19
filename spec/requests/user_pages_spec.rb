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
      describe "after saving the user" do
        before { click_button "Create my account" }
        let(:user) { User.find_by_email('toby@example.com') }
        it { should have_selector('title', text: user.full_name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Sign out')}

      end

    end

  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
       visit edit_user_path(user) 
    
    end
    describe "page" do
      it { should have_selector("h1", text: "Update your profile") }
      it { should have_selector("title", text: "Edit user") }
    end
    describe "with invalid information" do
         before { click_button "Save changes"}
         it { should have_content("error" )}
       end
    describe "with valid information" do
       let(:new_name) {"nooby"}
        let(:new_email) {"nooby@example.com"}
    before do
     
      
      fill_in "First name", with: new_name
      # fill_in "Last name", with: user.last_name
      fill_in "Email", with: new_email
      fill_in "Password", with: user.password
      fill_in "Confirm Password", with: user.password
       click_button "Save changes"
    end
    
      it { should have_selector("title", text: new_name )}
      it { should have_selector("div.alert.alert-success")}
      it { should have_link("Sign out", href: signout_path)}
      specify {user.reload.first_name==new_name}
      specify {user.reload.email==new_email}
    end
  end
  
  
end

