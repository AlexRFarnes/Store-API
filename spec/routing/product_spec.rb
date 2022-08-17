require 'rails_helper'

describe "Product resources routes" do
    it "Route Post for products" do
        expect(post: '/v1/products').to route_to(
            format: 'json',
            controller: 'v1/products',
            action: 'create'
        )
    end

    it "Route PUT to update products" do
        expect(put: '/v1/products/1').to route_to(
            format: 'json',
            controller: 'v1/products',
            action: 'update',
            id: '1'
        )
    end

    it "Route index products" do
        expect(get: '/v1/products').to route_to(
            format: 'json',
            controller: 'v1/products',
            action: 'index'
        )
    end

    it "Route delete products" do
        expect(delete: '/v1/products/1').to route_to(
            format: 'json',
            controller: 'v1/products',
            action: 'destroy',
            id: '1'
        )
    end

    it "Route to restore products" do
        expect(post: '/v1/products/1/restore').to route_to(
            format: 'json',
            controller: 'v1/products',
            action: 'restore',
            product_id: '1'
        )
    end
    
    
end
