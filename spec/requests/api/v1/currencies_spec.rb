require 'rails_helper'

RSpec.describe 'Api::V1::Currency', type: :request do

  let(:user) { create(:user) }

  let(:currency) { create(:currency) }

  describe 'GET currencies#index' do

    context 'when user is authenticated' do
      before do
        currency
        get api_v1_currencies_path, params: user.create_new_auth_token
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
        post api_v1_currencies_path, params: {currency: {name: "India"}}.merge(user.create_new_auth_token)
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
        put api_v1_currency_path(currency), params: {currency: {name: 'Indiatest'}}.merge(user.create_new_auth_token)
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
        put api_v1_currency_path(currency), params: user.create_new_auth_token
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
        delete api_v1_currency_path(currency), params: user.create_new_auth_token
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
        delete api_v1_currency_path(currency), params: user.create_new_auth_token
      end

      it 'checks the message' do
        expect(JSON(response.body)["message"]).to eq("Forbidden")
      end
    end
  end
end