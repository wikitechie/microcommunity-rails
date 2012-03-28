Given /^a group exists$/ do
  @group = FactoryGirl.create(:group)
end

Given /^the user is a member of the group$/ do
  @group.memberships.create(:member_id => @user)
end


When /^the user posts "([^"]*)" into the group publisher$/ do |post|
  visit group_path(@group)
  #to nest the rest of the test code in this block
  within("#group-publisher") do
  end

  fill_in "text", :with => post
  click_button "Post"

end

Then /^the user should be redirected to the group page$/ do
  current_path.should == group_path(@group)
end

Then /^a post with content "([^"]*)"  should appear in the social stream$/ do |post|
  find("#social-stream").should have_content  post
end

