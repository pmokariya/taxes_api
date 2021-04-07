class Item < ApplicationRecord
    belongs_to :item_category
    has_many :item_taxes, :dependent => :destroy
    validates :name, :rate, presence: true

    def price_with_all_taxes
        org_price = self.rate
        add_value_tax = self.item_taxes.where(tax_type: "value").pluck(:tax).sum 
        arr_of_value_from_per = []
        self.item_taxes.where(tax_type: "percentage").each do |percentage|
            arr_of_value_from_per << (org_price.to_i * percentage.tax.to_i) /100
        end
        org_price.to_i + add_value_tax.to_i + arr_of_value_from_per.sum
    end
end
