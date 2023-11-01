require 'rails_helper'

RSpec.describe 'Expenses', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user_id: user.id) }

  before(:each) do
    login_as(user, scope: :user)
  end

  describe 'GET /new' do
    scenario 'create a new expense' do
      visit "/categories/#{category.id}/expenses/new"
      fill_in 'expense[name]', with: 'Food expenses'
      fill_in 'expense[amount]', with: 100
      click_button 'Add Transaction'
      expect(page).to have_content('Expense was successfully created.')
    end

    it 'returns http success' do
      visit "/categories/#{category.id}/expenses/new"
      expect(page).to have_http_status(:success)
    end

    it 'render the index template' do
      visit "/categories/#{category.id}/expenses/new"
      expect(page).to have_content('ADD TRANSACTION')
    end
  end
end
