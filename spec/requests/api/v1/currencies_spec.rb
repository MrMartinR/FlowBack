require 'rails_helper'

RSpec.describe 'Api::V1::Currency', type: :request do

  let(:user) { create(:user) }

  let(:authentication) {
    post api_v1_user_session_path, params: {user: {email: user.email, password: user.password}}
    JSON(response.body) }

  let(:currency) { create(:currency) }

  let(:token) { authentication["token"]["token"] }

  let(:client) { authentication["token"]["client"] }

  let(:expiry) { authentication["token"]["expiry"] }

  describe 'GET currencies#index' do

    context 'when user is authenticated' do
      before do
        currency
        get api_v1_currencies_path, params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @currencies' do
        expect(assigns(:currencies)).to eq([currency])
      end
    end

    context 'when user is not authenticated' do

      before do
        get api_v1_currencies_path
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'POST currencies#create' do

    context 'when user is authenticated' do
      before do
        post api_v1_currencies_path, params: {uid: user.uid, "access-token": token, expiry: expiry, client: client, currency: {name: "India"}}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @currency' do
        expect(assigns(:currency)).to eq(Currency.first)
      end
    end

    context 'when user is not authenticated' do

      before do
        post api_v1_currencies_path
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'PUT currencies#update' do

    context 'when user is authenticated' do
      before do
        user.roles.first.update(name: "admin")
        put api_v1_currency_path(currency), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client, currency: {name: 'Indiatest'}}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @currency' do
        expect(assigns(:currency).name).to eq('Indiatest')
      end
    end

    context 'when user is not authenticated' do

      before do
        put api_v1_currency_path(currency)
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end

    context "when user is not authorized" do
      before do
        put api_v1_currency_path(currency), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'checks the message' do
        expect(JSON(response.body)["message"]).to eq("Forbidden")
      end
    end
  end

  describe 'Delete currencies#destroy' do

    context 'when user is authenticated' do
      before do
        user.roles.first.update(name: "admin")
        delete api_v1_currency_path(currency), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'checks the message' do
        expect(JSON(response.body)["message"]).to eq("The currency was deleted")
      end
    end

    context 'when user is not authenticated' do

      before do
        delete api_v1_currency_path(currency)
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end

    context "when user is not authorized" do
      before do
        delete api_v1_currency_path(currency), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'checks the message' do
        expect(JSON(response.body)["message"]).to eq("Forbidden")
      end
    end
  end
end