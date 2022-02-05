# _string_literal: true

require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'Chaw', password: '123456', email: 'chaw@gmail.com', confirmed_at: Time.now
      visit root_path
      fill_in 'Email', with: 'chaw@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit root_path
    end

    it 'shows the username' do
      expect(page).to have_content('Chaw')
    end

    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it 'shows number of posts for each user' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'show users page when clicked' do
      expect(page).to have_content('Number of posts: 0')
      click_on 'Chaw'
      expect(page).to have_current_path user_path(@user1)
    end
  end
end
