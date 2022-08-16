require 'rails_helper'

RSpec.describe V1::ProductsController, type: :controller do
    describe "Product registry" do
       let(:user) { create(:owner) } 
       let(:bearer) { create(:token, user: user) }
       let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
       let(:product) {
        {
            name: Faker::Book.title,
            description: Faker::Lorem.sentence(word_count: 50),
            price: rand(1..100)
        }
       }
       context "Correct product registration" do
            before do
                request.headers.merge! headers
                post(:create, format: :json, params: { product: product })
            end

            context "Response with status create" do
                subject { response }
                it { is_expected.to have_http_status(:created) }
            end

            context "Correct structure for product" do
                subject { payload_test }
                it { is_expected.to include(:id, :name, :price, :description, :created_at, :updated_at, :store_id) }
            end 

        end
        context "Failed product registration" do
            before do
                product[:name] = ""
                request.headers.merge! headers
                post(:create, format: :json, params: { product: product })
            end

            context "Response with status bad request" do
                subject { response }
                it { is_expected.to have_http_status(:bad_request) }
            end

            context "Correct structure for the list of errors" do
                subject { payload_test }
                it { is_expected.to include(:errors) }
            end   

        end
        context "Product without token" do
            before do
                post(:create, format: :json, params: { product: product })
            end

            context "Response with status unauthorized" do
                subject { response }
                it { is_expected.to have_http_status(:unauthorized) }
            end 
            
        end
    end
end