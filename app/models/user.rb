class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :category, foreign_key: 'user_id', class_name: 'Category', dependent: :destroy
  has_many :expense, foreign_key: 'author_id', class_name: 'Expense'

  validates :name, presence: true
end
