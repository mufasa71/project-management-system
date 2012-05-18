# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :time_entry do
    user_id 1
    activity_id 1
    project_id 1
    hours 1
    spent_on 1
    comments "MyString"
  end
end
