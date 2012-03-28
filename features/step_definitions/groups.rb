Given /^a group exists$/ do
  @group = FactoryGirl.create(:group)
end

When /^the user posts "([^"]*)" into the group publisher$/ do |post|
  visit group_path(@group)

  within("#group-publisher") do
    fill_in "#publisher", :with => post
    click_button "Post"
  end
end

Then /^the user should be redirected to the group page$/ do
  current_path.should == group_path(@group)
end

Then /^a post with content "([^"]*)"  should appear in the social stream$/ do |post|
  find("#social-stream").should have_content  post
end

