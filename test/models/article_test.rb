require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @article = @user.articles.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @article.valid?
  end

  test "user id should be present" do
    @article.user_id = nil
    assert_not @article.valid?
  end
  
  test "content should be present " do
    @article.content = "   "
    assert_not @article.valid?
  end
  
  test "order should be most recent first" do
    assert_equal Article.first, articles(:most_recent)
  end
end