FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    email
    password "FooBar"
    password_confirmation "FooBar"
    profile
  end

end

