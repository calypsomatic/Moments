require 'spec_helper'

feature 'user views moment calendar' do
  user = FactoryGirl.create(:user)
  visit moments_get_path
  first = Date.today.beginning_of_month
  days = Date.today.end_of_month.day
  

end