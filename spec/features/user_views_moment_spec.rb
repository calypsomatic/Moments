require 'spec_helper'
include Warden::Test::Helpers

feature 'User views moment' do 

  scenario 'User picks an artified moment' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    moment = FactoryGirl.create(:moment)
    art = FactoryGirl.create(:art, moment: moment)
    visit moment_art_path(moment, art)
    attach_file('Put art', "#{Rails.root}/spec/fixtures/test_pic.jpg")
    click_button 'Upload your art'
    visit moments_universal_path(date: Date.today)
    click_link 'any old string'
    expect(page).to have_content('any old string')
    expect(page).to have_css('src="#{Rails.root}/spec/fixtures/test_pic.jpg"')
  end
end