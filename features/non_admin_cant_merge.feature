Feature: Merge two articles

	As a non-admin user
	So that I do not destroy the blog
	I should not be able to merge articles together

Scenario: A non-admin cannot merge articles
	Given the blog is set up for non-admin
	And I am logged into the non-admin account
	And I follow "New Article"
	Then I should not see "Merge Articles"
	When I fill in "article_title" with "article1"
  And I fill in "article__body_and_extended_editor" with "article1"
	And I press "Publish"
	Then I should see "Manage articles"
	When I go to the edit page for "article1"
	Then I should be on the edit page for "article1"
	And I should see "Publish settings"
	And I should not see "Merge Articles"
