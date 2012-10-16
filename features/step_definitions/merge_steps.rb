Given /^the following articles exist/ do |article_table|
  article_table.hashes.each do |article|
    Article.create!(:type => article["type"], :title => article["title"], :author => article["author"], :body => article["body"])
  end
end


