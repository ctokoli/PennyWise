class Category < ApplicationRecord
  has_many :expenses, foreign_key: "category_id", class_name: "Expense", dependent: :destroy
  belongs_to :user, foreign_key: "user_id", class_name: "User"

  has_one_attached :image

  validates :name, presence: true, length: { minimum: 4, maximum: 50 }

end
