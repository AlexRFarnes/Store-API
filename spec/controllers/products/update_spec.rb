require 'rails_helper'

RSpec.describe V1::ProductsController, type: :controller do
    describe "Update products" do
        let(:user) { create(:owner) }
        let(:bearer) { create(:token, user: user) }
        let(:headers) { { Authorization: "Bearer #{bearer.token}" }}
        let(:product) { create(:product, store: user.store) }

        context "Product updated correctly" do
            before do
                request.headers.merge! headers
                put(:update, format: :json, params: { id: product.id, product: { name: "Test" } })
            end

            context "Response with status ok" do
                subject { response }
                it { is_expected.to have_http_status(:ok) }
            end

            context "Correct product structure" do
                subject { payload_test } 
                it { is_expected.to include(:id, :price, :description, :name, :store_id) }
            end

        end

        context "Product can't be updated" do
            before do
                request.headers.merge! headers
                put(:update, format: :json, params: { id: product.id, product: { name: "" } })
            end

            context "Response with status bad request" do
                subject { response } 
                it { is_expected.to have_http_status(:bad_request)}
            end

            context "Correct structure for the list of errors" do
                subject { payload_test } 
                it { is_expected.to include(:errors)}
            end
            
        end

        context "Update product without token" do
            before do
                put(:update, format: :json, params: { id: product.id, product: { name: "Test 2" } })
            end

            context "Response with status unauthorized" do
                subject { response } 
                it { is_expected.to have_http_status(:unauthorized)}
            end
            
        end
        
    end
end