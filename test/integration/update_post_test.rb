require 'test_helper'

class UpdatePostTest < ActionDispatch::IntegrationTest
  fixtures :posts

  test 'can update a post' do
    visit '/'
    click_link 'Edit' # just pick any old post
    fill_in 'Title', with: 'An updated post'
    fill_in 'Date', with: '28/8/2013'
    fill_in 'Body', with: "What a splendidly updated post this is."
    click_button 'Save changes'
    assert page.has_content?('Post was successfully updated.')
    assert page.has_content?('An updated post')
  end
end
