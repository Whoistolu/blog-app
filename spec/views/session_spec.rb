require 'rails_helper'

RSpec.describe 'Login', type: :system do
  describe 'login' do
    it 'shows the right content' do
      visit new_user_session_path
      expect(page).to have_content('Log in')
    end
  end
end
