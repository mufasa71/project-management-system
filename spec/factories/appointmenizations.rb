# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointmenization, :class => 'Appointmenizations' do
    appointment_id 1
    member_id 1
  end
end
