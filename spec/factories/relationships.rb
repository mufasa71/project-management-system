require 'factory_girl'

FactoryGirl.define do
  factory :relationship do
    follower_id 1
    followed_id 2
  end
end

