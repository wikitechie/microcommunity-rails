Feature: Group sharing
	In order to maximize and focus learning within a scope of interconnected people
	As a user
	I want to share infomratino with a group of people


	Background:
		Given a user exists
		And a group exists
		And the user is a member of the group

	Scenario: posting a message into a group
		Given the user is logged in
		When the user posts "Hello, World!" into the group publisher
		Then the user should be redirected to the group page
			And a post with content "Hello, World!"  should appear in the social stream

	Scenario: creating a new wiki page from the group page
		Given the user is logged in
		When the user posts a wikipage from the group
		Then he should be redirected to the group page
		And an activity of creating that wikipage should appear in the content stream of the group
			And an activity of creating that wikipage should appear in the content stream of the user

	@isstaif
	Scenario: adding a foreign wiki page to a group
		Given the user is logged in
			And a wikipage exists
		When the user adds the wikipage to the group
			And some action is performed on the wikipage
		Then he should be redirected to the wikipage page
			And the add to group button of the group should be ticked
			And that action should appear on the group content feed

