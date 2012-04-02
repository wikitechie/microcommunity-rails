Feature: Profile

@jobory
Scenario: redirect user to his profile when he sign up a new account
	When user sign up new account
	Then redirect user to his profile

Scenario: user visit his profile he see edit profile button
	Given a user exists
	And the user is logged in
	When the user visit his profile
	Then the user see edit profile button

Scenario: user visit another profile he does not see edit profile button
	Given a user exists
	And the user is logged in
	When the user visit another profile
	Then the user does not see edit profile button
