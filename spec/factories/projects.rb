# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "MyProject"
    identifier "my-identifier"
    due_date Date.today.next_month
  end
end
