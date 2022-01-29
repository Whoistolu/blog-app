require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post Model' do
    subject { Post.create(title: 'Title test', text: 'text', user_id: 1) }
    before { subject.save }

    it 'checks if subject is invalid if there is no title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'tests if title more than 250chs to be invalid' do
      subject.title = 'more than 250 more than 250 more than 250 more
      than 250 more than 250 more than 250 more than 250 more than 250 more than 250 more than 250 more than 250 more
      than 250 more than 250 more than 250 more than 250 more than 250 more than 250 more than 250 '
      expect(subject).to_not be_valid
    end
  end
  describe 'Post Model methods' do
    before do
      6.times do |number|
        subject.id = 1
        Comment.create(text: "test comment #{number}", user_id: 1, post: subject)
      end
    end

    it 'loads only the first five comments' do
      expect(subject.recent_5_comments.length).to eq(5)
    end

    it 'check if it increases the posts' do
      subject.user = User.find(1)
      prev = User.find(1).posts_counter
      subject.update_posts_counter
      expect(User.find(1).posts_counter).to eq(prev + 1)
    end
  end
end
