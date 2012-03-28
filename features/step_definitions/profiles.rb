When /^the user visit his profile$/ do
	visit(profile_path(@user))
end

Then /^the user see edit profile button$/ do
	page.should have_content('Edit')
end

When /^the user visit another profile$/ do
	visit(profile_path(Factory.create(:user)))
end

Then /^the user does not see edit profile button$/ do
	page.should_not have_content('Edit')
end
