Given /^the following articles exist:/ do |article_table|
  article_table.hashes.each do |article|
    Article.create!(:type => article["type"], :title => article["title"], :author => article["author"], :body => article["body"])
  end
end

Then /^the comments for (.*) and (.*) should be merged/ do |id1, id2|
	assert (Article.find_by_id(id1).comments & Article.find_by_id(id2).comments) == Article.find_by_id(id2).comments
end

Given /^the blog is set up for non-admin$/ do
	Blog.default.update_attributes!({:blog_name => 'Teh Blag',
                                   :base_url => 'http://localhost:3000'});
  Blog.default.save!
  User.create!({:login => 'admin',
                :password => 'aaaaaaaa',
                :email => 'joe@snow.com',
                :profile_id => 1,
                :name => 'admin',
                :state => 'active'})
  User.create!({:login => 'user1',
                :password => 'user1',
                :email => 'joe1@snow.com',
                :profile_id => 2,
                :name => 'publisher',
                :state => 'active'})

end

And /^I am logged into the non-admin account$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'user1'
  fill_in 'user_password', :with => 'user1'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end
