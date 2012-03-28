require 'spec_helper'

describe Event do
	before(:each) do
		@attr = {:title => "Wikitechie", :place => "SCS"}
	end

	it "should be able to add attendants" do
		user = Factory(:user)
		event = Factory(:event)
		event.attendants.create(@attr)
		event.attendants.create(@attr.merge({:title=>"TED"}))
		event.attendants.should_not be_empty
	end
end
