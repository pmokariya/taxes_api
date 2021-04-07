FactoryBot.define do
  factory :item_tax do
    tax_name {Faker::Name.name }
    tax_type {Faker::Name.name }
    tax {Faker::Name.name }
    item_id {create(:item).id}
  end 
end