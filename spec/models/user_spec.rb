require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Model' do
    subject { User.find(1) }

    it 'checks if subject is invalid if there is no name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'tests post counter to be less than 0' do
      subject.posts_counter = - 5
      expect(subject).to_not be_valid
    end
  end

  describe 'User Model methods' do
    before do
      6.times do |number|
        subject.id = 1
        Post.create(title: 'title', text: "test post #{number}", user: subject)
      end
    end

    it 'loads only the first three posts' do
      expect(subject.recent_3_posts.length).to eq(3)
    end
  end
end
