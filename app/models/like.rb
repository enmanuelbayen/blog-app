class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :update_likes_counter

  def as_json(_options = {})
    { author_id:, text:, id: }
  end

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
