require 'rails_helper'

RSpec.describe 'users/index', type: :system do
  describe 'index page' do
    let!(:user1) do
      User.create(name: 'Carlos Montana', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'teacher from venezuela',
                  posts_counter: 10)
    end
    let!(:user2) do
      User.create(name: 'Jhon Wick', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'teacher from venezuela/caracas',
                  posts_counter: 0)
    end

    before do
      visit users_path
    end

    it 'displays the username of all other users' do
      expect(page).to have_selector('h2', text: 'Carlos Montana')
      expect(page).to have_selector('h2', text: 'Jhon Wick')

      expect(page).to have_selector('.user-img[src="https://unsplash.com/photos/F_-0BxGuVvo"]', count: 2)

      expect(page).to have_selector('.user-post-count', text: 'Numbers of posts: 10', count: 1)
      expect(page).to have_selector('.user-post-count', text: 'Numbers of posts: 0', count: 1)
    end

    it 'redirects to user show page when user is clicked' do
      visit users_path
      click_link user1.name

      expect(page).to have_current_path(user_path(user1))
    end
  end
end
