require './spec/rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.create(name: 'John') }
  subject { Post.new(author:, title: 'Test Post', text: 'This is a test post.', comments_counter: 0, likes_counter: 0) }

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
        post = Post.create(author:, title: "Test Post", text: "This is a test post.")
        comment1 = post.comments.create(text: "Comment 1", created_at: Time.now - 5.days)
      comment2 = post.comments.create(text: "Comment 2", created_at: Time.now - 4.days)
      comment3 = post.comments.create(text: "Comment 3", created_at: Time.now - 3.days)
      comment4 = post.comments.create(text: "Comment 4", created_at: Time.now - 2.days)
      comment5 = post.comments.create(text: "Comment 5", created_at: Time.now - 1.day)
      comment6 = post.comments.create(text: "Comment 6", created_at: Time.now)

      expect(post.recent_comments).to eq([comment6, comment5, comment4, comment3, comment2])
    end
  end
end
