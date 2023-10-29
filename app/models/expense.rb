class Expense < ApplicationRecord
  belongs_to :author, foreign_key: "author_id", class_name: "User"
  belongs_to :category, foreign_key: "category_id", class_name: "Category"

  has_one_attached :image

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :name, presence: true, length: { minimum: 4, maximum: 50 }

end
