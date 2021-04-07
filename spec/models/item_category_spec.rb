require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
  include Shoulda::Matchers::ActiveRecord
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:item_category)).to be_valid
    end
  end
  it {should have_many(:items).dependent(:destroy)}
  it {should validate_presence_of(:name)}
end
