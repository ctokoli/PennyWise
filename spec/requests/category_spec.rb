require 'rails_helper'

RSpec.describe 'Categories', type: :request do

  let(:user) { FactoryBot.create(:user) }

  before(:each) do
    login_as(user, :scope => :user)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/categories'
      expect(response).to have_http_status(:success)
    end

    it 'render the index template' do
      get '/categories'
      expect(response).to render_template('index')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      category = FactoryBot.create(:category, user_id: user.id)
      get "/categories/#{category.id}"
      expect(response).to have_http_status(:success)
    end

    it 'render the show template' do
      category = FactoryBot.create(:category, user_id: user.id)
      get "/categories/#{category.id}"
      expect(response).to render_template('show')
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/categories/new'
      expect(response).to have_http_status(:success)
    end

    it 'render the new template' do
      get '/categories/new'
      expect(response).to render_template('new')
    end
  end
end
