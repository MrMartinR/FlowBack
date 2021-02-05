require 'rails_helper'

RSpec.describe 'Api::V1::Country', type: :request do

  let(:user) { create(:user) }

  let(:country) { create(:country) }

  describe 'GET countries#index' do

    context 'when user is authenticated' do
      before do
        country
        get api_v1_countries_path, params: user.create_new_auth_token
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
        post api_v1_countries_path, params: {country: {name: "Indiatest"}}.merge(user.create_new_auth_token)
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
        put api_v1_country_path(country), params: {country: {name: 'Indiatest'}}.merge(user.create_new_auth_token)
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
        put api_v1_country_path(country), params: user.create_new_auth_token
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
        delete api_v1_country_path(country), params: user.create_new_auth_token
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
        delete api_v1_country_path(country), params: user.create_new_auth_token
      end

      it 'checks the message' do
        expect(JSON(response.body)["message"]).to eq("Forbidden")
      end
    end
  end
end