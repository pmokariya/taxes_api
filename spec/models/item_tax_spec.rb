require 'rails_helper'

RSpec.describe ItemTax, type: :model do
  include Shoulda::Matchers::ActiveRecord
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:item_tax)).to be_valid
    end
  end
  it {should belong_to(:item)}
  it {should validate_presence_of(:tax_name)}
  it {should validate_presence_of(:tax_type)}
  it {should validate_presence_of(:tax)}
end
