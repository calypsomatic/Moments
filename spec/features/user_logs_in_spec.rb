require 'spec_helper'
include Warden::Test::Helpers

feature 'User logs in' 

# User home page should contain personal calendar
# and links to universal calendar
# and either a link or a form for adding today's moment

  scenario "User sees that they're logged in" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully.')
  end
end