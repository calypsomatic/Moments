require 'spec_helper'
include Warden::Test::Helpers

feature 'User creates an art' do

  let(:user) { FactoryGirl.create(:user) }
    
  before :each do
    Warden.test_mode!
    login_as(user, scope: :user)
  end

  after :each do
    Warden.test_reset!
  end

  scenario 'User sees un-artified moment on universal calendar' do
    empty_moment = FactoryGirl.create(:moment, day: Date.today)
    visit moments_universal_path(date: Date.today)
    expect(page).to have_content("artify")
  end

  scenario 'User selects moment to art' do
    empty_moment = FactoryGirl.create(:moment, day: Date.today)
    visit moments_universal_path(date: Date.today)
    click_link "artify this moment"
    expect(page).to have_button("Claim this moment's art")
  end

  scenario 'User claims moment to art' do
    empty_moment = FactoryGirl.create(:moment, day: Date.today)
    visit moment_path(empty_moment)
    expect(empty_moment.art).to be_nil
    click_button "Claim this moment's art?"
    expect(page).to have_content("claimed")
    empty_moment.reload
    expect(empty_moment.art).to be_an(Art)
    # user has art_in_progress boolean toggled to true
    # countdown begins until art must be submitted
  end

  scenario 'User submits art' do
    # user must return to page
    # user must click button
    # user's art_in_progress boolean toggled to false
    # art uploaded and stored assigned to moment 
  end

  scenario 'Time is up' do
    # user's art_in_progress toggled to false
    # moment's art returns to null/available
  end

end