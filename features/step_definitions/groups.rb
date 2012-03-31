Given /^a group exists$/ do
  @creator = FactoryGirl.create(:user)
  User.current_user = @creator
  @group = FactoryGirl.create(:group)
end

Given /^the user is a member of the group$/ do
  @group.memberships.create(:user_id => @user)
end


When /^the user posts "([^"]*)" into the group publisher$/ do |post|
  visit group_path(@group)
  #to nest the rest of the test code in this block
  within("#group-publisher") do
  end

  fill_in "post_text", :with => post
  click_button "Post"

end

Then /^the user should be redirected to the group page$/ do
  current_path.should == group_path(@group)
end

Then /^a post with content "([^"]*)"  should appear in the social stream$/ do |post|
  should have_content  post
end

When /^user vists the new group page$/ do
  visit new_group_path(@group)
end

When /^he enters valid group information$/ do
  @group = FactoryGirl.build(:group)
  fill_in "group_name", :with => @group.name
  fill_in "group_description", :with => @group.description
  click_button "Create Group"
end

Then /^he should be redirected to the group page$/ do
  @last_group = Group.last
  current_path.should == group_path(@last_group)
end

Then /^he should see the social stream with an entry about group creation$/ do
  page.should have_selector "#social-stream"
  page.should have_content "#{@user.profile.name} created a new group titled #{@group.name}"
end

Then /^he should see the content stream with instructions about creating a new content$/ do
  page.should have_selector "#content-stream"
  page.should have_content "You currently have no content. To post new content pick one above"
end

Then /^he should be a member of the group$/ do
  @last_group.users.include?(@user).should be_true
end

Then /^he should be the admin of the group$/ do
  @last_group.memberships.find_by_user_id(@user.id).admin?.should be_true
end

