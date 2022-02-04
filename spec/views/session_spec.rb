require 'rails_helper'

RSpec.describe 'Login', type: :system do
  describe 'login' do
    it 'shows the right content' do
      visit new_user_session_path
      expect(page).to have_content('Log in')
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
    end

    it 'Fill email and password inputs' do
      visit new_user_session_path
      sleep(1)
      fill_in 'Email', with: 'Moises'
      fill_in 'Password', with: '123456'
      sleep(1)
      click_button 'submit'
      expect(page).to have_content('Log in')
    end
  end
end

