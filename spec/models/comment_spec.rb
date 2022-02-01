require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    subject { Comment.new(text: 'test post 1', user_id: 1, post_id: 1) }

    before { subject.save }

    it 'check if comments text matches' do
      expect(subject.text).to eq('test post 1')
    end

    it 'checks that after adding the comment counter should not be same' do
      prev = Post.find(1).comments_counter
      subject.update_comments_counter
      expect(Post.find(1).comments_counter).to_not eq(prev)
    end

    it 'check if it increases the comments' do
      prev = Post.find(1).comments_counter
      subject.update_comments_counter
      expect(Post.find(1).comments_counter).to eq(prev + 1)
    end
  end
end
