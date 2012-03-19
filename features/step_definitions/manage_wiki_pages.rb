include Warden::Test::Helpers


When /^he posts a wiki page$/ do  
  visit("home")
  @wikipage = "Ruby on Rails is a cool language"  
  fill_in("Body", :with => @wikipage)
  find_button("Post").click
end

Then /^the wiki page should be published$/ do
  @last_wikipage = Wikipage.last
  visit("/wikipages/#{@last_wikipage.id}")  
  page.should have_content (@wikipage)
end

Then /^the wiki page should be published on his wall$/ do
  visit("/profiles/#{@user.id}")  
  page.should have_content (@wikipage)
end


