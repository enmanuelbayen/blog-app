require './spec/rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'John') }
  let(:post) { Post.create(title: 'Test Post', text: 'This is a test post.', author: user) }
  subject { Comment.new(author: user, post:, text: 'This is a test comment.') }

  context 'Validation' do
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  context 'Callbacks' do
    it "should update the post's comments_counter after create" do
      expect(post.comments_counter).to eq(0)
      subject.save
      post.reload
      expect(post.comments_counter).to eq(1)
    end
  end
end
