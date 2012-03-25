Given /^a user exists$/ do
  @user = FactoryGirl.create(:user)
end		

Given /^the user is logged in$/ do
  visit ("/users/sign_in")
  fill_in('Email', :with => @user.email)
  fill_in('Password', :with => @user.password)
  find_button('Sign in').click
end

Given /^the user has a list of friends$/ do
  @friends = [ FactoryGirl.create(:user), FactoryGirl.create(:user), FactoryGirl.create(:user)]
  @friends.each do |friend| 
    @user.friendships.create(:friend_id => friend.id)
  end
end

Given /^his friends have recently created some wikipages$/ do
  @friends_wikipages = []
  @friends.each do |friend|
    tmp = friend.wikipages.create(FactoryGirl.attributes_for(:wikipage))
    @friends_wikipages.push(tmp)
  end
end

When /^the user vists his home page$/ do
  visit(root_path)
end

Then /^the user should see his friends' wikipages$/ do
  @friends_wikipages.each do |wikipage|
    page.should have_content wikipage.body
  end
   
end

Given /^the user is following another user$/ do
  @followed_user = FactoryGirl.create(:user)
  @user.follow(@followed_user)
end

When /^the followed user creates a new wiki page$/ do
  @followed_user_wikipage = @followed_user.wikipages.create(FactoryGirl.attributes_for(:wikipage))
end

Then /^the according activity element should appear on the users news feed$/ do
  visit(root_path)
  page.should have_content(@followed_user.profile.name)  
  page.should have_content("created a new wiki page titled")
  page.should have_content(@followed_user_wikipage.title)  
end
