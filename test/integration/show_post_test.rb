require 'test_helper'

class ShowPostTest < ActionDispatch::IntegrationTest
  fixtures :posts

  test 'can show a post' do
    visit '/'
    click_link 'Show' # just pick any old post
    assert page.has_content?('Title:')
    assert page.has_content?('Body:')
    # this test is pretty weak
  end
end
