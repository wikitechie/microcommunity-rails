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


