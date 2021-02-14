require 'rails_helper'

RSpec.describe 'Api::V1::UserPlatforms', type: :request do
  let(:user) { create(:user) }
  let(:auth_headers) { user.create_new_auth_token }
  let(:user_platforms) { create_list(:user_platform, 10, user: user) }

  describe 'GET /api/v1/user_platforms' do
    before do
      user_platforms
      get api_v1_user_platforms_path, headers: auth_headers
    end

    it 'respond with 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'return all user platforms in the response' do
      expect(response_body['data'].count).to eq(10)
    end

    it 'return ordered user platforms with created_at in the response' do
      expected = UserPlatformsSerializer.new(user_platforms)
        .serializable_hash.as_json['data']
        .sort_by { |h| h['attributes']['created_at'] }.reverse

      expect(response_body['data']).to eq expected
    end
  end

  describe 'POST /api/v1/user_platforms' do
    let(:platform) { create(:platform) }
    let(:user_platform_attributes) do
      {
        data: {
          type: 'user_platforms',
          attributes: { platform_id: platform.id }
        }
      }
    end

    before do
      post api_v1_user_platforms_path, params: user_platform_attributes, headers: auth_headers
    end

    it 'respond with 201 status code' do
      expect(response).to have_http_status(:created)
    end

    it 'return the new created user platform in response' do
      expect(response_body).to eq(UserPlatformsSerializer.new(UserPlatform.last).serializable_hash.as_json)
    end

    it 'include location header of the new created user platform' do
      expect(response.location).to match(%r{/api/v1/user_platforms/})
    end
  end

  describe 'PATCH /api/v1/user_platforms' do
    let(:user_platform) { create(:user_platform, user: user) }
    let(:user_platform_attributes) do
      {
        data: {
          id: user_platform.id,
          type: 'user_platforms',
          attributes: { overview: 'updated overview of the user platform' }
        }
      }
    end

    before do
      patch api_v1_user_platform_path(user_platform), params: user_platform_attributes, headers: auth_headers
    end

    it 'respond with 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'return the updated user platform attributes in response' do
      expect(response_body['data']['attributes']['overview']).to match(/updated overview of/)
    end
  end

  describe 'delete /api/v1/user_platforms' do
    let(:user_platform) { create(:user_platform, user: user) }

    before do
      delete api_v1_user_platform_path(user_platform), headers: auth_headers
    end

    it 'respond with 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'return meta object for successfull user platform destroy' do
      expect(response_body).to have_meta('message', 'User Platform successfully deleted')
    end
  end
end
