include Warden::Test::Helpers

Given /^a user exists$/ do
  @user = FactoryGirl.create(:user)
end

Given /^the user is logged in$/ do
  visit ("/users/sign_in")
  fill_in('Email', :with => @user.email)
  fill_in('Password', :with => @user.password)
  find_button('Sign in').click
end

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


