When /^user sign up new account$/ do
  @user = FactoryGirl.create(:user)
end

Then /^redirect user to his profile$/ do
  visit(profile_path(@user.profile))
end

When /^the user visit his profile$/ do
	visit(profile_path(@user))
end

Then /^the user see edit profile button$/ do
	page.should have_content('Edit')
end

When /^the user visit another profile$/ do
	visit(profile_path(Factory.create(:user).profile))
end

Then /^the user does not see edit profile button$/ do
	page.should_not have_content('Edit')
end
