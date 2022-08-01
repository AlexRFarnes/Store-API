require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
    describe 'User\'s login session' do
        let(:user) { create(:owner, password: '123456')}
        context 'Correct login' do
            before do
                post(:login, format: :json, params: {
                    user: {
                        email: user.email,
                        password: '123456'
                    }
                })
            end
            context 'Correct status OK' do
                subject { response }
                it { is_expected.to have_http_status(:ok)}
            end
            context 'Response from correct login' do
                subject { payload_test }
                it { is_expected.to include(:id, :email, :age, :store) }
            end
        end
        context 'Failed login session' do
            before do
                post(:login, format: :json, params: {
                    user: {
                        email: user.email,
                        password: ''
                    }
                })
            end
            context 'Correct status for bad request' do
                subject { response }
                it { is_expected.to have_http_status(:bad_request)}
            end
            context 'Response from failed login' do
                subject { payload_test }
                it { is_expected.to include(:errors) }
            end
        end
    end
end