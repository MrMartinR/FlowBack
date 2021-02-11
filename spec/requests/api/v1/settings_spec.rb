require 'rails_helper'

RSpec.describe 'Api::V1::Settings', type: :request do
  describe 'GET /api/v1/settings' do
    let(:user) { create(:user) }

    before do
      auth_headers = user.create_new_auth_token
      get api_v1_settings_path, headers: auth_headers
    end

    it 'respond with 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'return user attributes in response body' do
      expect(response_body).to eq(UserSerializer.new(user).serializable_hash.as_json)
    end
  end

  describe 'PATCH /api/v1/settings' do
    context 'when sending valid settings attributes' do
      let(:user) { create(:user) }
      let(:setting_attributes) do
        {
          data: {
            id: user.id,
            type: 'settings',
            attributes: {
              username: 'my new username'
            }
          }
        }
      end

      before do
        auth_headers = user.create_new_auth_token
        patch api_v1_setting_path(user), params: setting_attributes, headers: auth_headers
      end

      it 'respond with 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'update settings attributes' do
        expect(response_body['data']['attributes']['username']).to eq('my new username')
      end
    end

    context 'when sending invalid settings attributes' do
      let(:user) { create(:user) }
      let(:current_user) { create(:user) }

      let(:setting_attributes) do
        {
          data: {
            id: user.id,
            type: 'settings',
            attributes: {
              username: user.username
            }
          }
        }
      end

      before do
        auth_headers = current_user.create_new_auth_token
        patch api_v1_setting_path(user), params: setting_attributes, headers: auth_headers
      end

      it 'respond with 200 status code' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'return error object with update failure message' do
        expect(response_body).to have_error(/has already been taken/)
      end
    end
  end
end
