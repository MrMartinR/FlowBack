require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do

  let(:user) { create(:user) }

  describe 'GET users#index' do

    context 'when user is authenticated' do
      before do
        user.roles.first.update(name: "admin")
        get api_v1_users_path, params: user.create_new_auth_token
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @users' do
        expect(assigns(:users)).to eq([user])
      end
    end

    context 'when user is not authenticated' do

      before do
        get api_v1_users_path
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end

    context 'when user is not authorized' do

      before do
        user
        get api_v1_users_path, params: user.create_new_auth_token
      end

      it 'checks the message' do
        expect(JSON(response.body)["message"]).to eq("Forbidden")
      end
    end
  end

  describe 'GET users#user_profile' do

    context 'when user is authenticated' do
      before do
        get api_v1_user_profile_path, params: user.create_new_auth_token
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @user' do
        expect(assigns(:user)).to eq(user)
      end
    end

    context 'when user is not authenticated' do

      before do
        get api_v1_user_profile_path
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'PUT users#update' do

    context "positive cases" do
      context 'when user is authenticated' do
        before do
          put api_v1_user_path(user), params: {user: {username: 'testname'}}.merge(user.create_new_auth_token)
        end

        it 'have status code 200' do
          expect(response).to have_http_status(:ok)
        end

        it 'checks the content type' do
          expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
        end

        it 'assigns @user' do
          expect(assigns(:user).username).to eq('testname')
        end
      end

      context 'when user is not authenticated' do

        before do
          user = create(:user)
          put api_v1_user_path(user)
        end

        it "have the status code 401" do
          expect(response).to have_http_status 401
        end
      end
    end
    context "negative cases" do
      before do
        put api_v1_user_path(user), params: {user: {username: ''}}.merge(user.create_new_auth_token)
      end

      it 'returns a error message' do
        expect(assigns(:user).errors.messages).to eq(:username => ["can't be blank", "is too short (minimum is 3 characters)"])
      end
    end
  end
end