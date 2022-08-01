require 'rails_helper'

describe 'User resources routes' do
    it 'register users' do
        expect(post: '/v1/users').to route_to(
            format: 'json',
            controller: 'v1/users',
            action: 'create'
        )
    end
end