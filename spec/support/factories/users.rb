require 'factory_girl'

FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :admin, class: User do
    email Faker::Internet.email
    password "any_password"
    admin true
  end

  factory :user do
    email Faker::Internet.email
    password "any_password"
  end

  factory :user_with_profile, class: User do
    email
    password "any_password"
    association :profile
  end

  factory :unique_user, class: User do
    email
    password "any_password"
  end
end
