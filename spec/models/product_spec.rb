require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validate for product model" do
    subject { build(:product) }

    it 'Validates if store id is present' do
      should validate_presence_of(:store_id)
    end

    it 'Validates if name is present' do
      should validate_presence_of(:name)
    end

    it 'Validates if description is present' do
      should validate_presence_of(:description)
    end

    it 'Validates if price is present' do
      should validate_presence_of(:price)
    end

    it 'Validates that it belongs to store' do
      should belong_to(:store)
    end
  end
end
