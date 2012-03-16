include Warden::Test::Helpers

Given /^there is a logged in user$/ do
  @user = User.create!(:email => "foo@bar.org", :password => "FooBar", :password_confirmation => "FooBar")
  login_as @user, :scope => :user
end

When /^he posts a wiki page$/ do  
  pending # express the regexp above with the code you wish you had
end

Then /^the wiki page should appear on his wall$/ do
  pending # express the regexp above with the code you wish you had
end