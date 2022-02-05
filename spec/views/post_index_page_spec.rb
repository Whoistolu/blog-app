# _string_literal: true

require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'Chaw', password: '123456', bio: 'Lorem ipsum dolor sit amet',
                            email: 'chaw@gmail.com', confirmed_at: Time.now
      visit root_path
      fill_in 'Email', with: 'chaw@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      @post1 = @user1.posts.create!(title: 'To Be',
                                    text: 'The big question is: "To be or not to be a Ruby programmer"')
      @post2 = @user1.posts.create!(title: 'Hello',
                                    text: 'Why people say HTML is not a programming language..."')
      @post3 = @user1.posts.create!(title: 'Hey',
                                    text: 'With the clif hanger seen in the first half of season 4, do you think..."')

      @comment1 = @post1.comments.create!(text: 'This is the first comment for the first post', user_id: @user1.id)
      @comment2 = @post1.comments.create!(text: 'This is the second comment', user_id: @user1.id)
      @comment3 = @post1.comments.create!(text: 'This is the third comment', user_id: @user1.id)
      @like1 = @post1.likes.create!(user_id: @user1.id)

      visit user_posts_path(@user1)
    end

    it 'shows user photo' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it 'shows the users username' do
      expect(page).to have_content('Chaw')
    end

    it 'shows number of posts by user' do
      expect(page).to have_content('Number of posts: 3')
    end

    it 'shows posts title' do
      expect(page).to have_content('To Be')
      visit user_session_path
    end

    it 'can see some of the post\'s body.' do
      expect(page).to have_content 'The big question is: "To be or not to be a Ruby programmer"'
    end

    it 'can see the first comments on a post' do
      expect(page).to have_content 'This is the first comment for the first post'
    end

    it 'can see how many comments a post has.' do
      expect(page).to have_content('Number of comments: 3')
    end

    it 'can see how many likes a post has.' do
      expect(page).to have_content('Number of likes: 1')
    end

    it 'can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content 'Pagination'
    end

    it 'When I click on a post, it redirects me to that post\'s show page.' do
      expect(page).to have_content 'Why people say HTML is not a programming language...'
    end
  end
end
