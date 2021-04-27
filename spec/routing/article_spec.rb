require 'rails_helper'

RSpec.describe '/article routes' do
    it 'routes to articles#show' do
        expect(get '/articles/1').to route_to('articles#show', id: '1')
    end
end