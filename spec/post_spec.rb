require './spec/rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.new(name: 'Carlos', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Tester') }
  subject { Post.new(author: author, title: 'Test Post', text: 'This is a test post.') }

  before { subject.save }

  context "Validation" do
    it "should be valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "should not be valid without a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "should have a maximum title length of 250 characters" do
      subject.title = "a" * 251
      expect(subject).to_not be_valid
    end
  end

  context "Callbacks" do
    it "should update the author's posts_counter after create" do
      expect(author.posts_counter).to eq(1)
      Post.create(author:, title: 'Post test 2', text: 'Description test 2')
      expect(author.posts_counter).to eq(2)
    end
  end

  context "Methods" do
    it "should return the 5 most recent comments" do
      Comment.create(text: 'Comment', post: subject, author: author, created_at: Time.now)
      Comment.create(text: 'Comment', post: subject, author: author, created_at: Time.now - 2.days)
      Comment.create(text: 'Comment', post: subject, author: author, created_at: Time.now - 4.days)
      Comment.create(text: 'Comment', post: subject, author: author, created_at: Time.now - 5.days)
      Comment.create(text: 'Comment', post: subject, author: author, created_at: Time.now - 7.days)
      Comment.create(text: 'Comment', post: subject, author: author, created_at: Time.now - 9.days)

      expect(subject.recent_comments).to eq(subject.comments.order(created_at: :desc).limit(5))
    end
  end
end
