require 'test_helper'

class DeletePostTest < ActionDispatch::IntegrationTest
  fixtures :posts

  test 'can delete a post' do
    visit '/'
    num_rows = page.all('table tr').count
    click_link 'Destroy' # just pick any old post
    assert page.has_css?('table tr', :count => num_rows - 1)
  end
end
