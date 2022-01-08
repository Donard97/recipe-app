require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Amine', email: 'amine@mail.com', password: 'password') }
  let(:recipe) do
    user.recipes.create(user_id: user.id, name: 'Wonderful cake', cooking_time: 5.5, preparation_time: 12.6,
                        description: 'Best food', public: true)
  end

  describe 'GET /index' do
    before do
      sign_in user
      get recipes_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Create Recipe')
    end
  end

  describe 'GET /new' do
    before do
      sign_in user
      get new_recipe_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Cooking time')
    end
  end

  describe 'GET /show' do
    before do
      sign_in user
      get recipe_path(recipe)
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Public')
    end
  end
end
