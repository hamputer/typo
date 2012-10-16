Given /^the following articles exist/ do |article_table|
  article_table.hashes.each do |article|
    Article.create!(:type => article["type"], :title => article["title"], :author => article["author"], :body => article["body"])
  end
end

Then /^the comments for '(.*)' and '(.*)' should be merged/ do |art1, art2|
	Comments.find_by_article(art1).each do |mainComment|
		Comments.find_by_article(art2).each do |	 
