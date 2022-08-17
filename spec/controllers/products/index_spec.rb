require 'rails_helper'

RSpec.describe V1::ProductsController, type: :controller do
    describe "List of products" do
        let(:user) { create(:owner) }
        let(:bearer) { create(:token, user: user) }
        let(:headers) { { Authorization: "Bearer #{bearer.token}" } }

        context "Correct list of products" do
            before do
                request.headers.merge! headers
                get(:index, format: :json)
            end

            context "Response with status ok" do
                subject { response }
                it { is_expected.to have_http_status(:ok) }
            end

            context "Correct structure for the list of products" do
                subject { payload_test }
                it { is_expected.to include(:products)}
            end
            
        end

        context "List of products without token" do
            before do
                get(:index, format: :json)
            end
            
            context "Response with status unauthorized" do
                subject { response }
                it { is_expected.to have_http_status(:unauthorized) }
            end

        end
        
    end
    
end