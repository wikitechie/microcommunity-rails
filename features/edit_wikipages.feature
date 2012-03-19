Feature: manage wiki pages

Scenario: show edit link for users
Given a user exists
And the user is logged in
And a wikipage exists
When the user views the wikipage
Then he should see the edit link