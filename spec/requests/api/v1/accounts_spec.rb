require 'rails_helper'

RSpec.describe 'Api::V1::Accounts', type: :request do
  describe 'GET /api/v1/accounts' do
    before do
      get api_v1_accounts_path
    end

    context 'when user is authenticated' do
      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when user is not authenticated' do
      it ''
    end
  end
end
