require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the content 'Swashfly Invoice System'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      visit '/static_pages/home'
      page.should have_content('Swashfly Invoice System')
    end
    
    it "should have the title 'Home'" do
      visit '/static_pages/home'
     page.should have_selector('title',text: "Swashfly Invoicing | Home")
    end
  end
end
