class Item < ApplicationRecord
    belongs_to :item_category
    hash_many :item_taxes
end
