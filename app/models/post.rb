class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_posts_counter

  def decrement_posts_counter
    author.decrement!(:posts_counter)
  end

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def as_json(_options = {})
    { title:, text:, id: }
  end

  def recent_comments
    comments.order(created_at: :asc).limit(5)
  end
end
