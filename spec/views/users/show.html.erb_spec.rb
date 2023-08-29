require 'rails_helper'

RSpec.describe 'users/show', type: :system do
  describe 'show page' do
    let!(:user) do
      User.create(
        name: 'John Doe',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'teacher from Mexico',
        posts_counter: 4
      )
    end

    let!(:post) do
      Post.create(title: 'Post 1', text: 'Text for post 1', author: user)
    end
    let!(:post2) do
      Post.create(title: 'Post 2', text: 'Text for post 2', author: user)
    end
    let!(:post3) do
      Post.create(title: 'Post 3', text: 'Text for post 3', author: user)
    end

    before do
      visit user_path(user)
    end

    it 'displays user information' do
      expect(page).to have_selector('.user-img[src="https://unsplash.com/photos/F_-0BxGuVvo"]', count: 1)
      expect(page).to have_content('John Doe')
      expect(page).to have_selector('.user-post-count', text: 'Numbers of posts: 3', count: 1)
      expect(page).to have_content('teacher from Mexico')
    end

    it 'displays the first 3 posts' do
      expect(page).to have_selector('h3', text: 'Post: Post 1')
      expect(page).to have_selector('h3', text: 'Post: Post 2')
      expect(page).to have_selector('h3', text: 'Post: Post 3')
    end

    it 'displays the button to see all posts' do
      expect(page).to have_link('See all posts')
    end

    it 'redirects to the post show page when a user post is clicked' do
      click_link('See post >', match: :first)

      expect(page).to have_current_path(user_post_path(user, post))
    end

    it 'redirects to the post index page when See all post link is clicked' do
      click_link('See all posts')

      expect(page).to have_current_path(user_posts_path(user))
    end
  end
end
