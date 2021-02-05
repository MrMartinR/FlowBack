require 'rails_helper'

RSpec.describe 'Api::V1::UserAccount', type: :request do

  let(:user) { create(:user) }

  let(:authentication) {
    post api_v1_user_session_path, params: {user: {email: user.email, password: user.password}}
    JSON(response.body) }

  let(:contact) { create(:contact) }

  let(:platform) { create(:platform, contact: contact) }

  let(:country) { create(:country) }

  let(:account) { create(:account, platform: platform, contact: contact) }

  let(:currency) { create(:currency) }

  let(:user_account) { create(:user_account, country: country, currency: currency, account: account, user: user) }

  let(:token) { authentication["token"]["token"] }

  let(:client) { authentication["token"]["client"] }

  let(:expiry) { authentication["token"]["expiry"] }

  describe 'GET user_accounts#index' do

    context 'when user is authenticated' do
      before do
        user_account
        get api_v1_user_accounts_path, params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @user_accounts' do
        expect(assigns(:user_accounts)).to eq([user_account])
      end
    end

    context 'when user is not authenticated' do

      before do
        get api_v1_user_accounts_path
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'POST user_accounts#create' do

    context 'when user is authenticated' do
      before do
        post api_v1_user_accounts_path, params: {uid: user.uid, "access-token": token, expiry: expiry, client: client, user_account: {name: "test", active: true, user_id: user.id, country_id: country.id, currency_id: currency.id, account_id: account.id}}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @user_account' do
        expect(assigns(:user_account)).to eq(UserAccount.first)
      end
    end

    context 'when user is not authenticated' do

      before do
        post api_v1_user_accounts_path
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'PUT user_accounts#update' do

    context 'when user is authenticated' do
      before do
        put api_v1_user_account_path(user_account), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client, user_account: {name: 'testaccount'}}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @user_account' do
        expect(assigns(:user_account).name).to eq('testaccount')
      end
    end

    context 'when user is not authenticated' do

      before do
        put api_v1_user_account_path(user_account)
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'Delete user_accounts#destroy' do

    context 'when user is authenticated' do
      before do
        delete api_v1_user_account_path(user_account), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'checks the message' do
        expect(JSON(response.body)["message"]).to eq("User account deleted")
      end
    end

    context 'when user is not authenticated' do

      before do
        delete api_v1_user_account_path(user_account)
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end
end