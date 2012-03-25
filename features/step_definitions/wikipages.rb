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

When /^he posts a wiki page$/ do  
  visit("home")
  @wikipage = FactoryGirl.build(:wikipage)  
  fill_in("Title", :with => @wikipage.title)
  fill_in("Body", :with => @wikipage.body)
  find_button("Post").click
  @last_wikipage = Wikipage.last
end

Then /^the wiki page should be published$/ do  
  visit(wikipage_path(@last_wikipage))
  page.should have_content (@wikipage.title)  
  page.should have_content (@wikipage.body)
end

Then /^the wiki page should be published on his wall$/ do
  visit("/profiles/#{@user.id}")  
  page.should have_content (@wikipage.body)
end

Then /^he should be redirected to the wiki page$/ do
  current_path.should == wikipage_path(@last_wikipage)
end
