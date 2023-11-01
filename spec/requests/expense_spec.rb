require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  let(:user) { FactoryBot.create(:user) }

  before(:each) do
    login_as(user, :scope => :user)
  end

  describe 'GET /index' do
    it 'returns http success' do
      category = FactoryBot.create(:category, user_id: user.id)
      get "/categories/#{category.id}/expenses/new"
      expect(response).to have_http_status(:success)
    end

    it 'render the index template' do
      category = FactoryBot.create(:category, user_id: user.id)
      get "/categories/#{category.id}/expenses/new"
      expect(response).to render_template('new')
    end
  end
end
