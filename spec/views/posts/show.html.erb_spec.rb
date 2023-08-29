require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :system do
  describe 'index page' do
    let!(:user) do
      User.create(name: 'carlos', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'teacher from vzla',
                  posts_counter: 10)
    end
    let!(:commenter) do
      User.create(name: 'pete', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'teacher from vzla caracas',
                  posts_counter: 0)
    end
    let!(:post) do
      Post.create(title: 'Post Title', text: 'Post Text', author: user)
    end
    let!(:comment1) do
      Comment.create(author: commenter, post:, text: 'comment 1')
    end
    let!(:comment2) do
      Comment.create(author: commenter, post:, text: 'comment 2')
    end
    let!(:comment3) do
      Comment.create(author: commenter, post:, text: 'comment 3')
    end
    before do
      visit user_post_path(user, post)
    end
    it 'displays the username of the selected user and the post title' do
      expect(page).to have_selector('h3', text: 'Post Title by carlos')
    end
    it 'displays the number of comments and likes' do
      expect(page).to have_selector('p', text: 'Comments: 3, Likes: 0')
    end
    it 'displays the post body' do
      expect(page).to have_selector('p', text: 'Post Text')
    end
    it 'displays the username of each commentor and the text of his comment' do
      expect(page).to have_selector('p', text: 'pete: comment 1')
      expect(page).to have_selector('p', text: 'pete: comment 2')
      expect(page).to have_selector('p', text: 'pete: comment 3')
    end
  end
end
