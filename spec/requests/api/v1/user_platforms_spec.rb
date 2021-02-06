require 'rails_helper'

RSpec.describe 'Api::V1::UserPlatform', type: :request do

  let(:user) { create(:user) }

  let(:contact) { create(:contact) }

  let(:platform) { create(:platform, contact: contact) }

  let(:user_platform) { create(:user_platform, platform: platform, user: user) }

  let(:user_loan) { create(:user_loan, user: user, loan: loan, user_account: user_account) }

  describe 'GET user_platforms#index' do

    context 'when user is authenticated' do
      before do
        user_platform
        get api_v1_user_platforms_path, params: user.create_new_auth_token
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @user_platforms' do
        expect(assigns(:user_platforms)).to eq([user_platform])
      end
    end

    context 'when user is not authenticated' do

      before do
        get api_v1_user_platforms_path
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'POST user_platforms#create' do

    context 'when user is authenticated' do
      before do
        post api_v1_user_platforms_path, params: {user_platform: {overview: "test", notes: "testnotes", user_id: user.id, platform_id: platform.id}}.merge(user.create_new_auth_token)
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @user_platform' do
        expect(assigns(:user_platform)).to eq(UserPlatform.first)
      end
    end

    context 'when user is not authenticated' do

      before do
        post api_v1_user_platforms_path
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'PUT user_platforms#update' do

    context 'when user is authenticated' do
      before do
        put api_v1_user_platform_path(user_platform), params: {user_platform: {overview: 'testhere'}}.merge(user.create_new_auth_token)
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @user_platform' do
        expect(assigns(:user_platform).overview).to eq('testhere')
      end
    end

    context 'when user is not authenticated' do

      before do
        put api_v1_user_platform_path(user_platform)
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'Delete user_platforms#destroy' do

    context 'when user is authenticated' do
      before do
        delete api_v1_user_platform_path(user_platform), params: user.create_new_auth_token
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'checks the message' do
        expect(JSON(response.body)["message"]).to eq("User platform  deleted")
      end
    end

    context 'when user is not authenticated' do

      before do
        delete api_v1_user_platform_path(user_platform)
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end
end