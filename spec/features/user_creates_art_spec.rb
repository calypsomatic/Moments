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

  scenario 'User sees universal calendar' do
    # this may not be where link comes from
  end

  scenario 'User selects moment to art' do
    # moments that are not arted should have option available
    # that moment's art should be assigned to this user
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