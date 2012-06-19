# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    prepared_by "MyString"
    description "MyText"
    comments "MyText"
    project_id 1
  end
end
