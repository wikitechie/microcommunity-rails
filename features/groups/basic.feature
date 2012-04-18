Feature: MicroCommunity Groups basic features

@isstaif
Scenario: a member joining an existing group
	Given a group exists
		And a user exists
		And the user is logged in
	When the user clicks the join button of the group
	Then he should be redirected to the group page
		And he should be a member of the group

