require 'spec_helper'
include Warden::Test::Helpers

feature 'user views moment calendar' do

  let(:user) { FactoryGirl.create(:user) }
    
  before :each do
    Warden.test_mode!
    login_as(user, scope: :user)
    visit moments_path
  end

  after :each do
    Warden.test_reset!
  end

  scenario 'user visits current month' do
    expect(page).to have_content(Date.today.strftime("%B"))
  end

  scenario 'user visits past months' do
    click_link "Previous month"
    expect(page).to have_content(Date.today.prev_month.strftime("%B"))
  end

  scenario 'user adds new moment from calendar' do
    click_link('Add moment to this day', match: :first)
    expect(page).to have_content("Today I")
  end

  scenario 'user views universal calendar' do
    user2 = FactoryGirl.create(:user)
    first_moment_sentence = "did something alone"
    other_moment_sentence = "did something without you"
    first_moment = FactoryGirl.create(:moment, user: user, sentence: first_moment_sentence, day: Date.today)
    other_moment = FactoryGirl.create(:moment, user: user2, sentence: other_moment_sentence, day: Date.today)
    click_link 'View universal calendar'
    expect(page).to have_content("did something without you")
    expect(page).to have_content("did something alone")
  end

end