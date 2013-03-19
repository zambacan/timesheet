require 'spec_helper'

describe "Static pages" do
  subject { page }
  describe "Home page" do
    before { visit root_path }
    # it "should have the content 'Swashfly Invoice System'" do
    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    it { should have_selector('h1',text: 'Swashfly Invoice System') }
    # end
    it {  should have_selector('title',text: full_title('')) }
    it { should_not have_selector('title',text: "| Home") }
  end

  describe "Contact page" do
    before { visit contact_path }
    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    it { should have_selector('h1',text: 'Contact') }
    it { should have_selector('title',text: full_title('Contact')) }
  end
  describe "About page" do
    before { visit about_path}
    it { should have_selector('h1',text: 'About Swashfly Timesheet') }
    it { should have_selector('title',text: full_title('About')) }
  end

end
