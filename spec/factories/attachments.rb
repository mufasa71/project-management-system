# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
    description "MyString"
    filename "MyString"
    attachable nil
    author_id 1
  end
end
