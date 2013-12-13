FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email@#{n}email.com"}
    password          "morethan8characters"
    password_confirmation "morethan8characters"
  end
  
end