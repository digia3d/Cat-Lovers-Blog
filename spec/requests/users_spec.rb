require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'should be success' do
      get users_path
      expect(response).to have_http_status(:ok)
    end

    it 'returns http :ok' do
      get users_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    let(:user) do
      User.create(
        name: 'John',
        bio: 'I am a software developer'
      )
    end
    before(:example) { get("/users/#{user.id}") }
    it 'should have a http success status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders corret page template' do
      expect(response.body).to include('John')
    end

    it 'renders show tempate' do
      expect(response).to render_template(:show)
    end
  end
end
