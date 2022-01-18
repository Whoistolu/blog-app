class Post < ApplicationRecord
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  belongs_to :user

  def recent_5_comments
    comment.order('created_at Desc').limit(5)
  end
end
