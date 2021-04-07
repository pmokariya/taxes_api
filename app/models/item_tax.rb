class ItemTax < ApplicationRecord
    belongs_to :item
    validates :tax_name, :tax_type, :tax, presence: true
    validate do |item_tax|
        item_tax.errors.add(:tax, "percentage should be < 100") if item_tax.tax_type == "percentage" && item_tax.tax.to_i > 100
    end
end
