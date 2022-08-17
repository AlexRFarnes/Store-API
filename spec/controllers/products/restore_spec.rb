require 'rails_helper'

RSpec.describe V1::ProductsController, type: :controller do
    describe "Restore product" do
        let(:user) { create(:owner) }
        let(:bearer) { create(:token, user: user) }
        let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
        let(:product) { create(:product, store: user.store) }

        context "Restore product correctly" do
            before do
                product.destroy
                request.headers.merge! headers
                post(:restore, format: :json, params: { product_id: product.id })
            end

            context "Response with status ok" do
                subject { response }
                it { is_expected.to have_http_status(:ok) }
            end

            context "Response with correct structure" do
                subject { payload_test }
                it { is_expected.to include(:id, :name, :price, :description, :store_id) }
            end
            
        end

        context "Fail restore of product" do
            before do
                product.destroy
                post(:restore, format: :json, params: { product_id: product.id })
            end

            context "Response with status unauthorized" do
                subject { response }
                it { is_expected.to have_http_status(:unauthorized)}
            end
            
        end
        
    end
    
end