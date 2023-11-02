FactoryBot.define do
  factory :category do
    name { 'food' }
    image { 'https://image.flaticon.com/icons/png/512/1046/1046821.png' }
    user_id { 1 }
  end
end
