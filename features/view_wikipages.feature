Feature: view wiki pages
    In order view what the community is producing
    As a web views
    I want to view wiki pages on the webwite

Scenario: viewing a wikipage
    Given a wikipage exists    
    When the wikipage is visited
    Then the wikipage should be there 
    
Scenario: listing wikipages
	Given a list of wikipages exist    
	When the wikipages list is visited
	Then the wikipages should be there
@focus	
Scenario: viewing friends' wikipages in home news feed
	Given a user exists
		And the user is logged in
		And the user has a list of friends
		And his friends have recently created some wikipages 
	When the user vists his home page
	Then the user should see his friends' wikipages
    	