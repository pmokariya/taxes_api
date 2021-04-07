require 'rails_helper'

RSpec.describe Item, type: :model do
  include Shoulda::Matchers::ActiveRecord
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:item)).to be_valid
    end
  end
  it {should belong_to(:item_category)}
  it {should have_many(:item_taxes).dependent(:destroy)}
  it {should validate_presence_of(:name)}
end
 