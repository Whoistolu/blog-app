# _string_literal: true

require 'rails_helper'

RSpec.describe 'Login', type: :system do
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

      visit user_path(@user1.id)
    end

    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it 'shows the username' do
      expect(page).to have_content('Chaw')
    end

    it 'shows number of posts for each user' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'shows the users bio' do
      expect(page).to have_content('Lorem ipsum dolor sit amet')
      visit user_session_path
    end

    it 'Should see the user\'s first 3 posts.' do
      expect(page).to have_content 'The big question is: "To be or not to be a Ruby programmer"'
      expect(page).to have_content 'Why people say HTML is not a programming language...'
      expect(page).to have_content 'With the clif hanger seen in the first half of season 4, do you think...'
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user1)
    end
  end
end
