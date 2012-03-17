Given /^a wikipage exists$/ do
   @wikipage = FactoryGirl.create(:wikipage)
end

When /^the wikipage is visited$/ do
  visit wikipages_path(@wikipage) 
end

Then /^the wikipage should be there$/ do
  page.should have_content @wikipage.body
end
