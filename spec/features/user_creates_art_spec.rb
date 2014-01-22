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
    expect(Art.in_progress?(user)).to be_true
    # countdown begins until art must be submitted
  end

  scenario 'User already has an art in progress' do
    empty_moment = FactoryGirl.create(:moment, day: Date.today)
    art = FactoryGirl.create(:art, user: user)
    visit moment_path(empty_moment)
    click_button "Claim this moment's art?"
    expect(page).to have_content('You already have an art in progress')
  end

  scenario 'User submits art' do
    moment = FactoryGirl.create(:moment)
    art = FactoryGirl.create(:art, moment: moment, user: user)
    visit root_path
    click_link 'View your art in progress'
    expect(page).to have_button('Upload your art')
    attach_file('Put art', "#{Rails.root}/spec/fixtures/test_pic.jpg")
    click_button 'Upload your art'
    expect(page).to have_content("Your art is uploaded now")

    #expect(art.in_progress).to be_false
    #expect art to be uploaded
  end

  scenario 'User cancels claim' do
    moment = FactoryGirl.create(:moment)
    art = FactoryGirl.create(:art, moment: moment, user:user)
    visit moment_art_path(moment, art)
    expect(art.in_progress?).to be_true
    expect(page).to have_content("currently in progress")
    click_link 'Cancel your claim'
    expect(page).to have_content("You have relinquished this moment")
  end

  scenario 'Time is up' do
    # user's art_in_progress toggled to false
    # moment's art returns to null/available
  end

end