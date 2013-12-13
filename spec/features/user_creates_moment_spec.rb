require 'spec_helper'
include Warden::Test::Helpers

feature 'User creates a moment' do

  let(:user) { FactoryGirl.create(:user) }
    
  before :each do
    Warden.test_mode!
    login_as(user, scope: :user)
  end

  after :each do
    Warden.test_reset!
  end

  scenario 'User sees a form' do
    visit root_path
    click_link "Add today's moment"
    visit new_moment_path
    # expect(page).to have_content('Today I')
  end

end
