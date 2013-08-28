require 'test_helper'

class ListPostsTest < ActionDispatch::IntegrationTest
  fixtures :posts

  test 'shows a list of posts'  do
    visit '/'
    assert page.has_content?('First fixture post')
    assert page.has_content?('Second fixture post')
  end
end
