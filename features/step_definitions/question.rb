When /^he post a new question$/ do
  visit("questions/new")
  @question = FactoryGirl.build(:question)  
  fill_in("Title", :with => @question.title)
  fill_in("Body", :with => @question.body)
  find_button("Save").click
end

Then /^he should redirect to question page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^he will see this message "([^"]*)"rails sergit$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

