require 'spec_helper'

describe "Authentication" do
  subject { page }
  describe "signin" do
    before { visit signin_path }
    describe "with invalid signin" do
      before { click_button "Sign in"}

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
      describe "after visiting another page" do
        before { click_link 'Home' }
        it { should_not have_selector('div.alert-error')}
      end
    end
    describe "with valid signin" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }
      it { should have_selector('title', text: user.full_name) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Settings', href: edit_user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
      describe "followed by sign out" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end

  end
  describe "authorization" do
    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          # get redirected here to the signin page because we are not signed in 
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "Sign in"
        end
        # now we are signed in
        describe "after signing in" do
          # it should remember that we were trying to edit and redirect us back there
          it "should render the desired protected page" do
            page.should have_selector('title', text: 'Edit user')
          end
        end
      end
      describe "in the Users controller" do
        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_selector('title', text: 'Sign in') }
        end
        describe "submitting to the update action" do
          # the following is different to how michael H did it....
          # he used the user_path
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end
      end

    end
    # user must be signed in to create a contact
    describe "in the contacts controller" do
      describe "submitting to the create controller" do
        before { post contacts_path }
        specify { response.should redirect_to(signin_path) }
      end
    end
    # ==========================================
    # this is the end of for non-signed-in users
    # ==========================================
    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user }

      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('title', text: full_title('Edit user')) }
      end

      describe "submitting a PUT request to the Users#update action" do
        before { put user_path(wrong_user) }
        specify { response.should redirect_to(root_path) }
      end
    end
  end
end


