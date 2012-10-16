Feature: Merge articles
	As a Typo admin
	So that I can keep the blog free or duplicates and organize similar articles
	I want to be able to merge articles together

Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist:
     | type    | title      | author    | body                       |
     | Article | article1   | user1     | Merging Merge     				 |
     | Article | article2   | user2     | My article is cool         |
     | Article | article3   | user1     | These people are weird     |

Scenario: When articles are merged, the merged article should contain the text of both previous articles
	When I follow "All Articles"
	Then I should see "article1"
	When I go to the edit page for "article1"
	Then I should see "Merge Articles"
	When I fill in "merge_with" with "2"
	And I press "Merge"
	Then I should see "Manage articles"
	And I should see "article1"
	When I follow "article1"
	Then I should see "user1"
	And I should see "Merging Merge"
	And I should see "My article is cool"
	And I should not see "user2"

Scenario: When articles are merged, the merged article should have one author 

Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article

Scenario: The title of the new article should be the title from either one of the merged articles
