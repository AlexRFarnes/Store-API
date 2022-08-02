require 'rails_helper'

RSpec.describe Token, type: :model do
  describe 'Validate token model' do
    subject { build(:token) }
    it 'Validates if token is present' do
      should validate_presence_of(:token)
    end
    it 'Validates if the user_id is present' do
      should validate_presence_of(:user_id)
    end
    it 'Validate if the expires_at is present' do
      should validate_presence_of(:expires_at)
    end
    it 'Validate if there is a relation with user' do
      should belong_to(:user)
    end
  end
end
