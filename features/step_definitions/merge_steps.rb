Given /^the following articles exist:/ do |article_table|
  article_table.hashes.each do |article|
    Article.create!(:type => article["type"], :title => article["title"], :author => article["author"], :body => article["body"])
  end
end

Then /^the comments for (.*) and (.*) should be merged/ do |id1, id2|
	assert (Article.find_by_id(id1).comments & Article.find_by_id(id2).comments) == Article.find_by_id(id2).comments
end
