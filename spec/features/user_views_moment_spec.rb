require 'spec_helper'
include Warden::Test::Helpers

feature 'User views moment' do 

  scenario 'User picks an artified moment' do
    user1 = FactoryGirl.create(:user)
    binding.pry
    user2 = FactoryGirl.create(:user)
    moment = FactoryGirl.create(:moment, user: user2)
    art = FactoryGirl.create(:art, :has_image, moment: moment, user: user1)
    login_as(user1, scope: :user)
    visit moments_universal_path(date: Date.today)
    click_link 'any old string'
    expect(page).to have_content('any old string')
    expect(page).to have_css("img.art-image")
  end
end