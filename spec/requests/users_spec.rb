require 'spec_helper'

describe "home page" do
  it "displays tha user's email after successfull login" do
    password = "abcdefr"
    user = FactoryGirl.create(:user, :password => password)
    visit new_user_session_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"

    page.should have_selector(".account-email", :text => user.email)
  end

end
