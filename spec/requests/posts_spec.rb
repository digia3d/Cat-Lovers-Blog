require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get user_posts_path(1) }
    it 'should be success' do
      expect(response).to have_http_status(:ok)
    end

    it "should render 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should return the correct placeholder text' do
      expect(response.body).to include('This is the place for all posts.')
    end
  end

  describe 'GET /show' do
    before(:each) { get user_post_path(1, 2) }
    it 'returns success' do
      expect(response).to have_http_status(:ok)
    end
  end
end
