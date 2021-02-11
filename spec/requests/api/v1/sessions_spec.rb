require 'rails_helper'

RSpec.describe 'Api::V1::Sessions', type: :request do
  describe 'POST /api/v1/sessions' do
    context 'when user attempts to sign in with invalid credentials' do
      let(:user) { create(:user) }
      let(:user_attributes) do
        {
          type: 'users',
          data: {
            attributes: {
              email: user.email,
              password: 'wrong password'
            }
          }
        }
      end

      before do
        post api_v1_user_session_path, params: user_attributes
      end

      it 'responds with 401 status code' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns authentication failure error object' do
        expect(response_body).to have_error(/Invalid login credentials/)
      end
    end

    context 'when user attempts to sign in with valid credentials' do
      let(:user) { create(:user) }
      let(:user_attributes) do
        {
          data: {
            type: 'users',
            attributes: {
              email: user.email,
              password: user.password
            }
          }
        }
      end

      before do
        post api_v1_user_session_path, params: user_attributes
      end

      it 'responds with 201 status code' do
        expect(response).to have_http_status(:created)
      end

      it 'include the authentication information in the headers' do
        %w[access-token uid client expiry token-type].each do |info|
          expect(response.headers[info]).not_to be nil
        end
      end

      it 'include the logged in user info in response body' do
        expect(response_body).to eq(UserSerializer.new(user).serializable_hash.as_json)
      end
    end
  end

  describe 'DELETE /api/v1/sessions' do
    context 'when logout is successful' do
      let(:user) { create(:user) }

      before do
        auth_headers = user.create_new_auth_token
        delete destroy_api_v1_user_session_path, headers: auth_headers
      end

      it 'respond with 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'return meta object with message for successfully signing out' do
        expect(response_body).to have_meta('message', 'Signed out successfully')
      end
    end

    context 'when user does not exist or not logged in' do
      before do
        delete destroy_api_v1_user_session_path
      end

      it 'respond with 404 status code' do
        expect(response).to have_http_status(:not_found)
      end

      it 'return meta object with message for successfully signing out' do
        expect(response_body).to have_error(/User was not found or was not logged in/)
      end
    end
  end
end
