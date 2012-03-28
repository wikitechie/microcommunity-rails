# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :membership do
    group_id 1
    user_id 1
    admin false
  end
end
