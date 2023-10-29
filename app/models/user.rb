class User < ApplicationRecord
  has_many :category, foreign_key: "user_id", class_name: "Category", dependent: :destroy
  has_many :expense, foreign_key: "author_id", class_name: "Expense",
  
  has_one_attached :image

  validates :name, presence: true, length: { minimum: 4, maximum: 50 }
end
