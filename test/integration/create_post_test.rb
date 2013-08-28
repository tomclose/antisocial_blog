require 'test_helper'

class CreatePostTest < ActionDispatch::IntegrationTest
  test 'can create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Title', with: 'My first post'
    fill_in 'Date', with: '28/8/2013'
    fill_in 'Body', with: "What a splendid post this is."
    click_button 'Create Post'
    assert page.has_content?('Post was successfully created.')
    assert page.has_content?('My first post')
  end
end
