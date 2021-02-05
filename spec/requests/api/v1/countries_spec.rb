require 'rails_helper'

RSpec.describe 'Api::V1::Country', type: :request do

  let(:user) { create(:user) }

  let(:authentication) {
    post api_v1_user_session_path, params: {user: {email: user.email, password: user.password}}
    JSON(response.body) }

  let(:country) { create(:country) }

  let(:token) { authentication["token"]["token"] }

  let(:client) { authentication["token"]["client"] }

  let(:expiry) { authentication["token"]["expiry"] }

  describe 'GET countries#index' do

    context 'when user is authenticated' do
      before do
        country
        get api_v1_countries_path, params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @countries' do
        expect(assigns(:countries)).to eq([country])
      end
    end

    context 'when user is not authenticated' do

      before do
        get api_v1_countries_path
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'POST countries#create' do

    context 'when user is authenticated' do
      before do
        post api_v1_countries_path, params: {uid: user.uid, "access-token": token, expiry: expiry, client: client, country: {name: "Indiatest"}}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @country' do
        expect(assigns(:country)).to eq(Country.first)
      end
    end

    context 'when user is not authenticated' do

      before do
        post api_v1_countries_path
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'PUT countries#update' do

    context 'when user is authenticated' do
      before do
        user.roles.first.update(name: "admin")
        put api_v1_country_path(country), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client, country: {name: 'Indiatest'}}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @country' do
        expect(assigns(:country).name).to eq('Indiatest')
      end
    end

    context 'when user is not authenticated' do

      before do
        put api_v1_country_path(country)
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end

    context "when user is not authorized" do
      before do
        put api_v1_country_path(country), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'checks the message' do
        expect(JSON(response.body)["message"]).to eq("Forbidden")
      end
    end
  end

  describe 'Delete countries#destroy' do

    context 'when user is authenticated' do
      before do
        user.roles.first.update(name: "admin")
        delete api_v1_country_path(country), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'checks the message' do
        expect(JSON(response.body)["message"]).to eq("The country was deleted")
      end
    end

    context 'when user is not authenticated' do

      before do
        delete api_v1_country_path(country)
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end

    context "when user is not authorized" do
      before do
        delete api_v1_country_path(country), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'checks the message' do
        expect(JSON(response.body)["message"]).to eq("Forbidden")
      end
    end
  end
end