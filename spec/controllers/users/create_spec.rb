require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
    describe 'Users registration' do
        let(:user) { { email: Faker::Internet.email, 
                       age: rand(30...100), 
                       password: Faker::Internet.password(min_length: 10, max_length: 20) } }
        context 'Correct user registration' do
            before do
                post(:create, format: :json, params: { user: user })
            end
            context 'Response with status created' do   
                subject { response }
                it { is_expected.to have_http_status(:created) }
            end
            context 'Response contains the correct user\'s values' do  
                subject { payload_test }
                it { is_expected.to include(:id, :email, :age) }
            end
        end
    end
end