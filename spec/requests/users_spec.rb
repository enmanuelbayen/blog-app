require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get '/users' }

    it 'response status should be correct' do
      expect(response).to have_http_status(:success)
    end

    it 'correct template should be rendered' do
      expect(response).to render_template(:index)
    end

    it 'response body should include the correct placeholder' do
      expect(response.body).to include('Users')
    end
  end

  describe 'GET #show' do
    before(:example) { get '/users/1' }

    it 'response status should be correct' do
      expect(response).to have_http_status(:success)
    end

    it 'correct template should be rendered' do
      expect(response).to render_template(:show)
    end

    it 'response body should include the correct placeholder' do
      expect(response.body).to include('User')
    end
  end
end
