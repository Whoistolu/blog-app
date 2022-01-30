class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  has_many :comments
  has_many :likes
  belongs_to :user

  def recent_5_comments
    comments.order('created_at Desc').limit(5)
  end

  # after_save :update_posts_counter

  # private

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
