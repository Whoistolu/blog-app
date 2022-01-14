require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) { get user_posts_path user_id: 32 }

    it 'returns http 200 success' do
      expect(response).to have_http_status(200)
    end
    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end
    it 'should render the correct text in the template' do
      expect(response.body).to include('show the posts of a user')
    end
  end

  describe 'GET /show' do
    before(:each) { get user_post_path user_id: 32, id: 54 }

    it 'should return correct response' do
      expect(response).to have_http_status(200)
    end
    it 'should render the correct template' do
      expect(response).to render_template(:show)
    end
    it 'should have the text Posts' do
      expect(response.body).to include('show posts details')
    end
  end
end