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
    expect(page).to have_content('Today I')
  end

  scenario 'User sees moment is added' do
    visit new_moment_path
    fill_in 'Today I...', with: 'did a thing'
    prev_mom = Moment.count
    click_button 'Create Moment'
    expect(page).to have_content('Moment was successfully created')
    expect(Moment.count).to be >(prev_mom)
  end

  scenario "User enter's today's moment" do
    # moment = FactoryGirl.create(:moment, user: user, day: Time.new)
    # expect(moment.day).to be today's date
  end

  scenario "User creates moment for a different day" do
    # click_link Choose a different day
    # see option for days
    # somehow delineate which days have already been momented
    # moment.day = that day
  end

end
