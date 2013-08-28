require 'test_helper'

class CreatePostTest < ActionDispatch::IntegrationTest
  test 'can create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Title', with: 'My first post'
    fill_in 'Date', with: '28/8/2013'
    fill_in 'Body', with: "What a splendid post this is."
    click_button 'Save changes'
    assert page.has_content?('Post was successfully created.')
    assert page.has_content?('My first post')
  end

  test 'rejects post with no title' do
    visit '/'
    click_link 'New Post'
    fill_in 'Title', with: ''
    fill_in 'Date', with: '28/8/2013'
    fill_in 'Body', with: "What a splendid post this is."
    click_button 'Save changes'
    assert page.has_content?("Title can't be blank")
    assert page.has_content?('What a splendid post this is.') # check we have old info
  end
end
