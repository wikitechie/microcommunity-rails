Given /^a wikipage exists$/ do
   @wikipage = FactoryGirl.create(:wikipage)
end

When /^the wikipage is visited$/ do
  visit wikipages_path(@wikipage) 
end

Then /^the wikipage should be there$/ do
  page.should have_content @wikipage.body
end

Given /^a list of wikipages exist$/ do  
  @wikipage1 = FactoryGirl.create(:wikipage)
  @wikipage2 = FactoryGirl.create(:wikipage)
  @wikipage3 = FactoryGirl.create(:wikipage)  
end

When /^the wikipages list is visited$/ do
  visit wikipages_path
end

Then /^the wikipages should be there$/ do
  page.should have_content @wikipage1.body
  page.should have_content @wikipage2.body
  page.should have_content @wikipage3.body
end
