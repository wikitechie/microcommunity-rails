Given /^a group exists$/ do
  @creator = FactoryGirl.create(:user)
  User.current_user = @creator
  @group = FactoryGirl.create(:group)
  User.current_user = nil
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

When /^the user posts a wikipage from the group$/ do
  visit group_path(@group)

  @wikipage = FactoryGirl.build(:wikipage)
  fill_in "wikipage_title", :with => @wikipage.title
  fill_in "wikipage_body", :with => @wikipage.body
  find_button("Save").click
end

Then /^an activity of creating that wikipage should appear in the content stream of the group$/ do
  page.should have_content "#{@user.profile.name} created a new wiki page titled #{@wikipage.title}"
end

Then /^an activity of creating that wikipage should appear in the content stream of the user$/ do
  pending # express the regexp above with the code you wish you had
end

When /^the user adds the wikipage to the group$/ do
  visit wikipage_path(@wikipage)
  click_link @group.name
end

When /^some action is performed on the wikipage$/ do
  visit edit_wikipage_path @wikipage
  fill_in "Body", :with => @wikipage.body
  click_button "Save"
end

Then /^that action should appear on the group content feed$/ do
  visit group_path @group
  page.should have_content "#{@user.profile.name} edited a wiki page titled #{@wikipage.title}"
end


Then /^he should be redirected to the wikipage page$/ do
  current_path.should == wikipage_path(@wikipage)
end

Then /^the add to group button of the group should be ticked$/ do
  within("#add-to-group") do
    page.should have_selector "i"
  end
end


When /^the user clicks the join button of the group$/ do
  visit group_path @group
  click_button "join-group"
end

Then /^he should be a member of the group$/ do
  page.should_not have_css("#join-group")
end

