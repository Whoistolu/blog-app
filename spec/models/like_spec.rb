require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'like model' do
    subject { Like.new(user_id: 1, post_id: 1) }

    before { subject.save }

    it 'check if it increases the posts' do
      prev = Post.find(1).likes_counter
      subject.update_likes_counter
      expect(Post.find(1).likes_counter).to eq(prev + 1)
    end
  end
end
