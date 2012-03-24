Feature: wikipages    

Background
Given a logged in user exists with email "samer@example.org"
And he is on his home page

Scenario: a new wiki page pop-up window
When the user presses a new wiki page button
Then a pop-up window appears with a form for wikipages

Scenario: posting a wikipage from home page
Given a user posts a new wikipage with title "Rails" and content "Rails is great"
Then an activity of creating a wikipage "Rails" should appear in the content stream of the user "samer@example.org"
Then the page should appear on his stream

Scenario: creating a new wiki page from the group page
	When the user posts a wiki page titled "Rails" from the page of the group "Ruby on Rails"
	Then an activity of creating a wikipage "Rails" should appear in the content stream of the user "samer@gmail.com"
	And the wiki page should be published

Scenario: viewing friends' wikipages in home news feed
	Given a user exists
		And the user is logged in
		And the user has a list of friends
		And his friends have recently created some wikipages 
	When the user vists his home page
	Then the user should see his friends' wikipages
   	
