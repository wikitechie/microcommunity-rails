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
    	