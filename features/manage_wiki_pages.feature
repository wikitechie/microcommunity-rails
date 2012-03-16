Feature: manage wiki pages
    In order share objective ideas without the need of a wiki website
    As a user
    I want to manage my own wiki pages

Scenario: posting a wiki page
    Given there is a logged in user
    When he posts a wiki page
    Then the wiki page should appear on his wall