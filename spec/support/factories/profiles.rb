require 'factory_girl'

FactoryGirl.define do
  factory :profile do
    username Faker::Name.name
    skype "skype"
  end
end
