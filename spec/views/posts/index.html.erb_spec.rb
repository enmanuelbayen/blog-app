require 'rails_helper'
RSpec.describe 'posts/index.html.erb', type: :system do
  describe 'index page' do
    let!(:user) do
      User.create(name: 'carlos', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'teacher from venezuela',
                  posts_counter: 10)
    end
    let!(:commenter) do
      User.create(name: 'pete', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'teacher from venezuela/caracas',
                  posts_counter: 0)
    end
    let!(:post) do
      Post.create(title: 'Post Title', text: 'Post Text', author: user)
    end
    let!(:comment1) do
      Comment.create(author: commenter, post:, text: 'comment test 1')
    end
    before do
      visit user_posts_path(user)
    end
    it 'displays the username of the user' do
      expect(page).to have_selector('h2', text: 'carlos')
    end
    it 'displays the profile photo of the user' do
      expect(page).to have_selector('.user-img[src="https://unsplash.com/photos/F_-0BxGuVvo"]', count: 1)
    end
    it 'displays the number of posts the user has written' do
      expect(page).to have_selector('p', text: 'Numbers of posts: 1')
    end
    it 'displays the post title' do
      expect(page).to have_selector('h3', text: 'Post Title')
    end
    it 'displays some of the post\'s body' do
      expect(page).to have_selector('p', text: 'Post Text')
    end
    it 'displays some of the post\'s comments' do
      expect(page).to have_selector('p', text: 'comment test 1')
    end
    it 'displays how many comments and likes a post has' do
      expect(page).to have_selector('p', text: 'Comments: 1, Likes: 0')
    end
    it 'displays a section for pagination' do
      expect(page).to have_selector('button', text: 'Pagination')
    end
    it "redirects me to that post's show page when clicking on a post" do
      post = Post.create(title: 'Sample Post', text: 'Sample post text', author: user)
      visit user_posts_path(user)
      click_link 'Sample Post'
      expect(page).to have_current_path(user_post_path(user, post))
    end
  end
end
