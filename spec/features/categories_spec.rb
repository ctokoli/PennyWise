require 'rails_helper'

RSpec.describe 'Categories Page', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user_id: user.id) }

  before(:each) do
    login_as(user, scope: :user)
  end

  scenario 'create a new category' do
    visit '/categories/new'
    fill_in 'category[name]', with: 'image'
    click_button 'Add Category'
    expect(page).to have_content('Category was successfully created.')
  end

  describe 'GET /index' do
    it 'returns http success' do
      visit '/categories'
      expect(page).to have_http_status(:success)
    end

    it 'render the index template' do
      visit '/categories'
      expect(page).to have_content('CATEGORIES')
    end

    it 'render the show template' do
      visit "/categories/#{category.id}"
      expect(page).to have_content(category.name)
    end
  end
end
