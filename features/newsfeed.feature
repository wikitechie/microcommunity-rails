Feature: News Feed
In order to keep up to date with information interesting for me
As a user
I want to know the latest activities of people I follow

@focus
Scenario: wiki page creation
	Given a user exists
		And the user is logged in
		And the user is following another user
	When the followed user creates a new wiki page
	Then the according activity element should appear on the users news feed

Scenario: loading an empty news feed
  Given a user exists
    And the user is logged in
  When the user vists his home page
  Then he should see that there is nothing

