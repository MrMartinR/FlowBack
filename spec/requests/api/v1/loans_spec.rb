require 'rails_helper'

RSpec.describe 'Api::V1::Loans', type: :request do

  let(:user) { create(:user) }

  let(:authentication) {
    post api_v1_user_session_path, params: {user: {email: user.email, password: user.password}}
    JSON(response.body) }

  let(:country) { create(:country) }

  let(:currency) { create(:currency) }

  let(:loan) { create(:loan, created_by: user, currency: currency, country: country) }

  let(:token) { authentication["token"]["token"] }

  let(:client) { authentication["token"]["client"] }

  let(:expiry) { authentication["token"]["expiry"] }

  describe 'GET loans#index' do

    context 'when user is authenticated' do
      before do
        loan
        get api_v1_loans_path, params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @loans' do
        expect(assigns(:loans)).to eq([loan])
      end
    end

    context 'when user is not authenticated' do

      before do
        get api_v1_loans_path
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'POST loan#create' do

    context 'when user is authenticated' do
      before do
        post api_v1_loans_path, params: {uid: user.uid, "access-token": token, expiry: expiry, client: client, loan: {name: "test", country_id: country.id, currency_id: currency.id, gender: "male", code: "IND", amount: 200}}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @loan' do
        expect(assigns(:loan)).to eq(Loan.first)
      end
    end

    context 'when user is not authenticated' do

      before do
        post api_v1_loans_path
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'PUT loan#update' do

    context 'when user is authenticated' do
      before do
        user.roles.first.update(name: "admin")
        put api_v1_loan_path(loan), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client, loan: {name: 'testloan'}}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @loan' do
        expect(assigns(:loan).name).to eq('testloan')
      end
    end

    context 'when user is not authenticated' do

      before do
        put api_v1_loan_path(loan)
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end

    context "when user is not authorized" do
      before do
        put api_v1_loan_path(loan), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client, loan: {name: 'testloan'}}
      end

      it 'checks the message' do
        expect(JSON(response.body)["message"]).to eq("Forbidden")
      end
    end
  end

  describe 'Delete loan#destroy' do

    context 'when user is authenticated' do
      before do
        user.roles.first.update(name: "admin")
        delete api_v1_loan_path(loan), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'checks the message' do
        expect(JSON(response.body)["message"]).to eq("Loan  deleted")
      end
    end

    context 'when user is not authenticated' do

      before do
        delete api_v1_loan_path(loan)
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end

    context "when user is not authorized" do
      before do
        delete api_v1_loan_path(loan), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'checks the message' do
        expect(JSON(response.body)["message"]).to eq("Forbidden")
      end
    end
  end
end