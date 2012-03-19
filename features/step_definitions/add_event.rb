When /^the user creates an event with valid data$/ do
	@event = @user.events.create(FactoryGirl.attributes_for(:event))
end

Then /^the event should be published$/ do
  @last_event = Event.last
  visit("/events/#{@last_event.id}")  
  page.should have_content @event.title
  page.should have_content @event.place
end

Then /^I should be marked as going$/ do
  @events.attenders.include?(@user).should == true
end

Then /^I should be directed to the event page$/ do
  pending # express the regexp above with the code you wish you had
end

