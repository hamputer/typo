Feature: Merge two articles

	As an Admin
	So that I can relate similar articles
	I want to be able to merge articles together

Scenario: A non-admin cannot merge articles
	Given the blog is set up
	And I am logged into the admin panel
	And I follow "Users"
	And I follow "New User"
	And I fill in "user_login" with "user1"
	And I fill in "user_password" with "user1"
	And I fill in "user_password_confirmation" with "user1"
	And I fill in "user_email" with "user1"
	And I press "Save"
	Then I should see "User was successfully created."
	And I follow "Log out"
	And I fill in "user_login" with "user1"
	And I fill in "user_password" with "user1"
	And I press "Login"
	Then I should see "Login successful"
	When I follow "New Article"
	Then I should not see "Merge Articles"
	When I fill in "article_title" with "article1"
  And I fill in "article__body_and_extended_editor" with "article1"
	And I press "Publish"
	Then I should see "Manage articles"
	When I go to the edit page for "article1"
	Then I should be on the edit page for "article1"
	And I should see "Publish settings"
	And I should not see "Merge Articles"
