When /^the user creates an event with valid data$/ do
	@event = @user.events.create(FactoryGirl.attributes_for(:event))
	@event.attend(@user)
end

Then /^the event should be published$/ do
  @last_event = Event.last
  visit("/events/#{@last_event.id}")
  page.should have_content @event.title
  page.should have_content @event.place
end

#duplicated
Then /^I should be marked as going$/ do
	pending
end

Then /^I should be directed to the event page$/ do
  pending # express the regexp above with the code you wish you had
end


Given /^an event exists$/ do
  @event = FactoryGirl.create(:event)
end

When /^the user attends an event$/ do
  visit event_path(@event)
	print page.html
  click_link 'Attend'
end

Then /^the user should be marked as going$/ do
  pending # express the regexp above with the code you wish you had
end
