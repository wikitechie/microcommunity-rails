# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    text "MyText"
    user_id 1
    owner_id 1
  end
end
