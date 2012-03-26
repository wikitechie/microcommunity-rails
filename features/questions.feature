Feature: Questions
In order to keep up to date with information interesting for me
As a user
I want to know the latest activities of people I follow

@walid
Scenario: question add
	Given a user exists
        And the user is logged in
        When he post a new question
        Then he should redirect to question page
        And he will see this message "your question has being  added succesfully"rails sergit
