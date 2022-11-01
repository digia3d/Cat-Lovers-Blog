require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    let(:user) do
      User.create!(
        name: 'John',
        bio: 'I am a software developer',
        posts_counter: 2
      )
    end
    before(:example) { get("/users/#{user.id}/posts") }
    it 'should have a http success status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders corret page template' do
      expect(response.body).to include('John')
    end

    it 'renders index tempate' do
      expect(response).to render_template(:index)
    end
  end
end