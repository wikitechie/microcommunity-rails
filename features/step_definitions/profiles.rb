When /^user sign up new account$/ do
  @user = FactoryGirl.build(:user)
  visit "/users/sign_up"
  fill_in "user_email", :with => @user.email
  fill_in "name", :with => "Bar"
  fill_in "user_password", :with => @user.password
  fill_in "user_password_confirmation", :with => @user.password
  click_button "Sign up"
end

Then /^redirect user to his profile$/ do
  @profile = User.find_by_email(@user.email).profile
  current_path.should == profile_path(@profile)
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
