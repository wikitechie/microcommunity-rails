Feature: MicroCommunity Groups

Background
	Given a logged user exists

Scenario: creating a new MicroCommunity group
	When the user presses the new group button
		And enters valid information
	Then he should be redirected to the group page
		And he should see the social stream with an entry about group creation
		And he should see the content stream with instructions about creating a new content
		And he should be the admin of the group
