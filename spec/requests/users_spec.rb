require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Cork', email: 'example@mail.com', password: 'password') }
  describe 'GET /index' do
    before do
      sign_in user
      get root_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
  end
end
