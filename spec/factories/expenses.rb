FactoryBot.define do
  factory :expense do
    name { 'Food expenses' }
    amount { 100 }
    author_id { 1 }
    category_id { 1 }
  end
end
