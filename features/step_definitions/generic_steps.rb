@factory = {}

Given /^a "([^"]*)" exists$/ do |arg1|
  @factory[:arg1] = FactoryGirl.create(arg1)
end

