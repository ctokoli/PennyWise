require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = FactoryBot.create(:user)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end
  end

  describe 'public instance methods' do
    context 'should return' do
      it 'all the users' do
        expect(User.all).to eq([@user])
      end
    end
  end
end
