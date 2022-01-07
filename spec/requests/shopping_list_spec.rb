require 'rails_helper'

RSpec.describe 'ShoppingLists', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/shopping_list/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/shopping_list/show'
      expect(response).to have_http_status(:success)
    end
  end
end
