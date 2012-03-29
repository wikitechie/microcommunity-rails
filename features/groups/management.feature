Feature: MicroCommunity Groups

Background:
	Given a user exists

@isstaif
Scenario: creating a new MicroCommunity group
	Given the user is logged in
	When user vists the new group page
		And he enters valid group information
	Then he should be redirected to the group page
		And he should see the social stream with an entry about group creation
		And he should see the content stream with instructions about creating a new content
		And he should be the admin of the group

