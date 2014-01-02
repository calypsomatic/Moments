require 'spec_helper'
include Warden::Test::Helpers

feature 'user views moment calendar' do

  scenario 'user visits current month' do
    user = FactoryGirl.create(:user)
    Warden.test_mode!
    login_as(user, scope: :user)
    visit moments_path
    expect(page).to have_content(Date.today.strftime("%B"))
  end

  scenario 'user visits past months' do
    user = FactoryGirl.create(:user)
    Warden.test_mode!
    login_as(user, scope: :user)
    visit moments_path
    click_link "Previous month"
    expect(page).to have_content(Date.today.prev_month.strftime("%B"))
  end
end