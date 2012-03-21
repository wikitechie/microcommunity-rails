FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  
  factory :user do
    email 
    password "FooBar"
    password_confirmation "FooBar"   
  end
  
  factory :wikipage do
    body "Ruby on Rails is a cool framework"
    user 
  end
end