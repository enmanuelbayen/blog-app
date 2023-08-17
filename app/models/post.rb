class Post < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: 'auhtor_id'
    has_many :comments
    has_many :likes
  end
  