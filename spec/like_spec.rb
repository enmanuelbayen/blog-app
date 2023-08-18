require './spec/rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'John') }
  let(:post) { Post.create(title: 'Test Post', text: 'This is a test post.', author: user) }
  subject { Like.new(author: user, post:) }

  context 'Validation' do
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  context 'Callbacks' do
    it "should update the post's likes_counter after create" do
      expect(post.likes_counter).to eq(0)
      subject.save
      post.reload
      expect(post.likes_counter).to eq(1)
    end
  end
end
