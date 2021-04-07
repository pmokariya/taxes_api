FactoryBot.define do
  factory :item do
    name {Faker::Name.name }
    rate {Faker::Name.name }
    item_category_id {create(:item_category).id }
  end 
end