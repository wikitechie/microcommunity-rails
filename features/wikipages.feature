Feature: wikipages    

Scenario: posting a wikipage from home page
    Given a user exists 
    And the user is logged in
    When he posts a wiki page
    Then he should be redirected to the wiki page
    	And the wiki page should be published
    	And the wiki page should be published on his wall 

Scenario: viewing friends' wikipages in home news feed
	Given a user exists
		And the user is logged in
		And the user has a list of friends
		And his friends have recently created some wikipages 
	When the user vists his home page
	Then the user should see his friends' wikipages
   	
