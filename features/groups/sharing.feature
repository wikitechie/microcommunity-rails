MicroCommunity Groups are groups in which its memebers share content in two streams:
* Social Stream: in this stream members can post photos, posts and events
* Content Stream: in this stream appears the activity of members on group content.

Group content is not exclusive to the group, it is only content which is followed by the group. A content is followed by a group when one of its members assigns the following relationship between a piece of content and between the group. 

Background
	Given a logged user exists with email "samer@gmail.com"
	Given a group exists named "Ruby on Rails"
	
Scenario: posting a message into a group
	When the user posts "Hello, World!" into the group publisher
	Then a post with content "Hello, World!"  should appear in the social stream

Scenario: creating a new wiki page from the group page
	When the user posts a wiki page titled "Rails" from the page of the group "Ruby on Rails"
	Then an activity of creating a wikipage "Rails" should appear in the content stream of the group "Rails Study"
		And an activity of creating a wikipage "Rails" should appear in the content stream of the user "samer@gmail.com"
		
