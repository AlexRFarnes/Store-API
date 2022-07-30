require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations for user model' do
    subject { build(:user) }

    it 'validates if email is present' do
      should validate_presence_of(:email)
    end

    it 'validates if password is present' do
      should validate_presence_of(:password)
    end

    it 'validates if type is present' do
      should validate_presence_of(:type)
    end

    it 'validates if age is presente' do
      should validate_presence_of(:age)
    end

    it 'validates if the email is unique' do
      should validate_uniqueness_of(:email)
    end

    it 'validates that emails with incorrect format are not accepted' do
      should_not allow_value('test').for(:email)
    end

    it 'validates if age is an integer' do
      should validate_numericality_of(:age).only_integer
    end

    it 'validates if age is greater than or equal to 18' do
      should validate_numericality_of(:age).is_greater_than_or_equal_to(18)
    end

    it 'validates if age is less than or equal to 100' do
      should validate_numericality_of(:age).is_less_than_or_equal_to(100)
    end

  end
end
