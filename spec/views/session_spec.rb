require 'rails_helper'

RSpec.describe 'Login', type: :system do
  describe 'login' do
    it 'shows the right content' do
      visit new_user_session_path
      sleep(5)
      expect(page).to have_content('Log in')
    end
    it 'shows username input' do
      visit new_user_session_path
      sleep(5)
      expect(page).to have_content('Email')
    end
    it 'shows password input' do
      visit new_user_session_path
      sleep(5)
      expect(page).to have_content('Password')
    end
    it 'shows submit button' do
      visit new_user_session_path
      sleep(5)
      expect(page).to have_content('Log in')
    end
  end
end

