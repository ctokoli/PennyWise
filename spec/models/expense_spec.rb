require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    author = FactoryBot.create(:user)
    category = FactoryBot.create(:category, user_id: author.id)
    @expense = FactoryBot.create(:expense, author_id: author.id, category_id: category.id)
  end

    describe 'validations' do
      it 'is valid with valid attributes' do
        expect(@expense).to be_a(Expense)
        expect(@expense).to be_valid
      end
    end


    describe 'public instance methods' do
      context 'should return' do
        it 'all the expenses' do
          expect(Expense.all).to eq([@expense])
        end
      end
    end

    describe 'public class methods' do
      context 'should return' do
        it 'all the expenses' do
          expect(Expense.all).to eq([@expense])
        end
      end
    end

    describe 'check model values' do
        it 'the total amount of expenses' do
          expect(@expense.amount).to eq(100)
        end

        it 'should return name' do
          expect(@expense.name).to eq('Food expenses')
        end
    end
end
