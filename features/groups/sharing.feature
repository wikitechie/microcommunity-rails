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

@isstaif
	Scenario: creating a new wiki page from the group page
		Given the user is logged in
		When the user posts a wikipage from the group
		Then he should be redirected to the group page
		And an activity of creating that wikipage should appear in the content stream of the group
			And an activity of creating that wikipage should appear in the content stream of the user

