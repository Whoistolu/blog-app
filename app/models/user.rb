class User < ApplicationRecord
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  has_many :posts, foreign_key: 'user_id'

  def recent_3_posts
    Post.last(3)
  end
end
