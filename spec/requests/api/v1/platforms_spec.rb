require 'rails_helper'

RSpec.describe 'Api::V1::Platforms', type: :request do
  describe 'GET /api/v1/platforms' do
    let(:user) { create(:user) }
    let!(:platforms) { create_list(:platform, 5) }

    before do
      auth_headers = user.create_new_auth_token
      get api_v1_platforms_path, headers: auth_headers
    end

    it 'respond with 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'return list of all platforms' do
      expect(response_body).to eq(PlatformsSerializer.new(platforms).serializable_hash.as_json)
    end
  end

  describe 'POST /api/v1/platforms' do
    context 'when user attempts to create a platform' do
      let(:user) { create(:user) }
      let(:platform_attributes) do
        {
          data: {
            type: 'platforms',
            attributes: attributes_for(:platform)
          }
        }
      end

      before do
        auth_headers = user.create_new_auth_token
        post api_v1_platforms_path, params: platform_attributes, headers: auth_headers
      end

      it 'respond with 403 status code' do
        expect(response).to have_http_status(:forbidden)
      end

      it 'return authorization message in response' do
        expect(response_body).to have_error(/Only admin or contributer/)
      end
    end

    context 'when admin create a platform with valid attributes' do
      let(:admin) { create(:admin) }
      let(:contact) { create(:public_contact) }
      let(:platform_attributes) do
        {
          data: {
            type: 'platforms',
            attributes: attributes_for(:platform, contact_id: contact.id)
          }
        }
      end

      before do
        auth_headers = admin.create_new_auth_token
        post api_v1_platforms_path, params: platform_attributes, headers: auth_headers
      end

      it 'respond with 201 status code' do
        expect(response).to have_http_status(:created)
      end

      it 'return the created platform in response' do
        expect(response_body).to eq(PlatformsSerializer.new(Platform.last).serializable_hash.as_json)
      end

      it 'include the created contact link in location header' do
        expect(response.location).to match(%r{/api/v1/platforms})
      end
    end

    context 'when admin create a platform with invalid attributes' do
      let(:admin) { create(:admin) }
      let(:platform_attributes) do
        {
          data: {
            type: 'platforms',
            attributes: attributes_for(:platform)
          }
        }
      end

      before do
        auth_headers = admin.create_new_auth_token
        post api_v1_platforms_path, params: platform_attributes, headers: auth_headers
      end

      it 'respond with 422 status code' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'return the created platform in response' do
        expect(response_body).to have_error(/must exist/)
      end
    end
  end

  describe 'PATCH /api/v1/platforms' do
    let(:admin) { create(:admin) }
    let(:platform) { create(:platform) }

    before do
      auth_headers = admin.create_new_auth_token
      patch api_v1_platform_path(platform), params: platform_attributes, headers: auth_headers
    end

    context 'when admin update a platform with valid attributes' do
      let(:platform_attributes) do
        {
          data: {
            id: platform.id,
            type: 'platforms',
            attributes: { min_investment: '5000' }
          }
        }
      end

      it 'respond with 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'return the updated platform in resopnse' do
        expect(response_body['data']['attributes']['min_investment']).to eq '5000'
      end
    end

    context 'when admin update a platform with invalid attributes' do
      let(:platform_attributes) do
        {
          data: {
            id: platform.id,
            type: 'platforms',
            attributes: { contact_id: nil }
          }
        }
      end

      it 'respond with 422 status code' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'return the created platform in response' do
        expect(response_body).to have_error(/must exist/)
      end
    end
  end

  describe 'delete /api/v1/platforms' do
    let(:admin) { create(:admin) }

    context 'when admin deletes a platform' do
      let(:platform) { create(:platform) }

      before do
        auth_headers = admin.create_new_auth_token
        delete api_v1_platform_path(platform), headers: auth_headers
      end

      it 'respond with 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'return meta object specifiying that record is destroyed' do
        expect(response_body).to have_meta('message', 'Platform successfully deleted')
      end
    end

    context 'when admin attempts to delete null platform' do
      before do
        auth_headers = admin.create_new_auth_token
        delete api_v1_platform_path('platform-id-not-found'), headers: auth_headers
      end

      it 'respond with 404 status code' do
        expect(response).to have_http_status(:not_found)
      end

      it 'return error in resopnse body' do
        expect(response_body).to have_error(/Couldn't find Platform/)
      end
    end
  end
end
