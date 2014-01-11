FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@mail.com"}
    password          "morethan8characters"
    password_confirmation "morethan8characters"
  end

  factory :moment do
    sentence 'any old string'
    day Date.today
    user
  end

  factory :art do
    user
    moment_id 1
  end
end