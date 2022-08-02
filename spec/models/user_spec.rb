require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations for user model' do
    subject { build(:owner) }

    it 'Validates if email is present' do
      should validate_presence_of(:email)
    end

    it 'Validates if password is present' do
      should validate_presence_of(:password)
    end

    it 'Validates if type is present' do
      should validate_presence_of(:type)
    end

    it 'Validates if age is presente' do
      should validate_presence_of(:age)
    end

    it 'Validates if the email is unique' do
      should validate_uniqueness_of(:email)
    end

    it 'Validates that emails with incorrect format are not accepted' do
      should_not allow_value('test').for(:email)
    end

    it 'Validates if age is an integer' do
      should validate_numericality_of(:age).only_integer
    end

    it 'Validates if age is greater than or equal to 18' do
      should validate_numericality_of(:age).is_greater_than_or_equal_to(18)
    end

    it 'Validates if age is less than or equal to 100' do
      should validate_numericality_of(:age).is_less_than_or_equal_to(100)
    end

    it 'Validate that only owners or employees can be created' do
      should validate_inclusion_of(:type).in_array(%w[Employee Owner])
    end
    it 'Validate if there is a relation with store' do
      should belong_to(:store)
    end
    it 'Validate if there is a relation with token' do
      should have_many(:tokens)
    end
  end
end
