require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'should returns http 200 success' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'should render the correct template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'should render the correct text in the template' do
      get users_path
      expect(response.body).to include('list of users is here')
    end
  end

  describe 'GET /show' do
    before(:each) { get user_path(32) }

    it 'should return correct response' do
      expect(response).to have_http_status(200)
    end

    it 'should render the show template ' do
      expect(response).to render_template(:show)
    end

    it 'should have the text Posts' do
      expect(response.body).to include('Show the user details by ID')
    end
  end
end
