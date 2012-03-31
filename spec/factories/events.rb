# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "Wikitechie Lecture"
    place "SCS"
    datetime "2012-03-19 18:27:57"
    user
  end
end
