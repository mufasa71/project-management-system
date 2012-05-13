# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    project_id 1
    subject "Any subject"
  end
end
