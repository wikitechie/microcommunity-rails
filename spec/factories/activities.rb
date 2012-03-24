# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    user_id 1
    verb "MyString"
    action_object_id 1
    action_object_type "MyString"
    target_object_id 1
    target_object_type "MyString"
  end
end
