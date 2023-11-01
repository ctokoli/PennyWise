require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category, user_id: user.id)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@category).to be_a(Category)
      expect(@category).to be_valid
    end
  end


  describe 'public instance methods' do
    context 'should return' do
      it 'all the categories' do
        expect(Category.all).to eq([@category])
      end
    end
  end

  describe 'should return value of category' do
      it 'the total amount of expenses' do
        expect(@category.name).to eq('food')
      end

      it 'should return name' do
        expect(@category.image).to eq('https://image.flaticon.com/icons/png/512/1046/1046821.png')
      end
  end
end
