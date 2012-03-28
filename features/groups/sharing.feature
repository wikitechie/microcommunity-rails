Feature: Group sharing
	In order to maximize and focus learning within a scope of interconnected people
	As a user
	I want to share infomratino with a group of people


	Background:
		Given a user exists
		And a group exists
		And the user is a member of the group

	@isstaif
	Scenario: posting a message into a group
		Given the user is logged in
		When the user posts "Hello, World!" into the group publisher
		Then the user should be redirected to the group page
			And a post with content "Hello, World!"  should appear in the social stream

	Scenario: creating a new wiki page from the group page
		When the user posts a wiki page titled "Rails" from the page of the group "Ruby on Rails"
		Then an activity of creating a wikipage "Rails" should appear in the content stream of the group "Rails Study"
			And an activity of creating a wikipage "Rails" should appear in the content stream of the user "samer@gmail.com"

