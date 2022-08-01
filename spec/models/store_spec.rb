require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'Validations for store model' do
    subject { build(:store) }
    it 'Validates if name is present' do
      should validate_presence_of(:name)
    end
    it 'Validates if there is a relation with owner' do
      should have_one(:owner)
    end
    it 'Validates if there is a relation with employees' do
      should have_many(:employees)
    end
  end
end
