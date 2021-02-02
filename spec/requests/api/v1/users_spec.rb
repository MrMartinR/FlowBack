require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do

  describe 'GET users#index' do

    context 'when user is authenticated' do
      before do
        user = create(:user)
        user.roles.first.update(name: "admin")
        post api_v1_user_session_path, params: {user: {email: user.email, password: user.password}}
        body = JSON(response.body)
        token = body["token"]["token"]
        client = body["token"]["client"]
        expiry = body["token"]["expiry"]
        get api_v1_users_path, params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @users' do
        expect(assigns(:users)).to eq([User.first])
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
  end

  describe 'GET users#user_profile' do

    context 'when user is authenticated' do
      before do
        user = create(:user)
        user.roles.first.update(name: "admin")
        post api_v1_user_session_path, params: {user: {email: user.email, password: user.password}}
        body = JSON(response.body)
        token = body["token"]["token"]
        client = body["token"]["client"]
        expiry = body["token"]["expiry"]
        get api_v1_user_profile_path, params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @user' do
        expect(assigns(:user)).to eq(User.first)
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
          user = create(:user)
          user.roles.first.update(name: "admin")
          post api_v1_user_session_path, params: {user: {email: user.email, password: user.password}}
          body = JSON(response.body)
          token = body["token"]["token"]
          client = body["token"]["client"]
          expiry = body["token"]["expiry"]
          put api_v1_user_path(user), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client, user: {username: 'testname'}}
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
        user = create(:user)
        user.roles.first.update(name: "admin")
        post api_v1_user_session_path, params: {user: {email: user.email, password: user.password}}
        body = JSON(response.body)
        token = body["token"]["token"]
        client = body["token"]["client"]
        expiry = body["token"]["expiry"]
        put api_v1_user_path(user), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client, user: {username: ''}}
      end

      it 'returns a error message' do
        expect(assigns(:user).errors.messages).to eq(:username => ["can't be blank", "is too short (minimum is 3 characters)"])
      end
    end
  end
end