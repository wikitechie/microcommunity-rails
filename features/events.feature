Feature: Add Event
In order to make it easy for people to arrange and know about events
As a user
I need to create and manage events

Scenario: Adding a successful event
    Given a user exists
        And the user is logged in
    When the user creates an event with valid data
    Then the event should be published
        And I should be marked as going
        And I should be directed to the event page

@MhdSyrwan
Scenario: Attending an event
    Given a user exists
      And an event exists
      And the user is logged in
    When the user attends an event
    Then the user should be marked as going
