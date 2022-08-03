require 'rails_helper'

RSpec.describe V1::StoresController, type: :controller do
    let(:user) { create(:owner) }
    let(:bearer) { create(:token, user: user) }
    let(:headers) { { Authorization: "Bearer #{bearer.token}" } }
    let(:stores) { create_list(:store, 5) }
    context "Query store by id" do
        before do
            request.headers.merge! headers
            get(:show, format: :json, params: { id: user.store.id })
        end
        context "Status 200" do
            subject { response }
            it { is_expected.to have_http_status(:ok) }
        end
        context "Correct structure for Store response" do
            subject { payload_test }
            it { is_expected.to include(:id, :name)}
        end        
    end   
    context "Can't query the store that belongs to other user" do
        before do
          request.headers.merge! headers
          get(:show, format: :json, params: { id: rand(2..stores.size) })  
        end
        context "Response status Not Authorized" do
            subject { response }
            it { is_expected.to have_http_status(:unauthorized)}
        end    
    end
    context "Query store without token" do
        before do
            get(:show, format: :json, params: { id: user.store.id })
        end
        context "Status no authorized" do
            subject { response }
            it { is_expected.to have_http_status(:unauthorized)}
        end
        
    end
    
end