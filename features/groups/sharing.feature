Feature: Group sharing
	In order to maximize and focus learning within a scope of interconnected people
	As a user
	I want to share infomratino with a group of people


	Background:
		Given a logged user exists with email "samer@gmail.com"
		And a group exists named "Ruby on Rails"
		
	@isstaif	
	Scenario: posting a message into a group
		When the user posts "Hello, World!" into the group publisher
		Then a post with content "Hello, World!"  should appear in the social stream

	Scenario: creating a new wiki page from the group page
		When the user posts a wiki page titled "Rails" from the page of the group "Ruby on Rails"
		Then an activity of creating a wikipage "Rails" should appear in the content stream of the group "Rails Study"
			And an activity of creating a wikipage "Rails" should appear in the content stream of the user "samer@gmail.com"
			
