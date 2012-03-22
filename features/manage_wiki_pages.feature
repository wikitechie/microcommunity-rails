Feature: manage wiki pages
    In order share objective ideas without the need of a wiki website
    As a user
    I want to manage my own wiki pages
@focus
Scenario: successfully posting a wiki page
    Given a user exists 
    And the user is logged in
    When he posts a wiki page
    Then he should be redirected to the wiki page
    	And the wiki page should be published
    	And the wiki page should be published on his wall 