Feature: manage wiki pages
    In order share objective ideas without the need of a wiki website
    As a user
    I want to manage my own wiki pages

Scenario: posting a wiki page
    Given a user exists 
    And the user is logged in
    When he posts a wiki page
    Then the wiki page should be published
    	And the wiki page should be published on his wall