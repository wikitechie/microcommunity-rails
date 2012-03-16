FactoryGirl.define do
  factory :user do
    email "foo@bar.org"
    password "FooBar"
    password_confirmation "FooBar"   
  end
  
  factory :wikipage do
    text "Ruby on Rails is a cool framework"
    user
  end
end