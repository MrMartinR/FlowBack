require 'rails_helper'

RSpec.describe 'Api::V1::UserLoan', type: :request do

  let(:user) { create(:user) }

  let(:authentication) {
    post api_v1_user_session_path, params: {user: {email: user.email, password: user.password}}
    JSON(response.body) }

  let(:contact) { create(:contact) }

  let(:platform) { create(:platform, contact: contact) }

  let(:country) { create(:country) }

  let(:account) { create(:account, platform: platform, contact: contact) }

  let(:originator) { create(:originator) }

  let(:platform_originator) { create(:platform_originator, platform: platform, originator: originator) }

  let(:currency) { create(:currency) }

  let(:user_account) { create(:user_account, country: country, currency: currency, account: account, user: user) }

  let(:loan) { create(:loan, country: country, platform_originator: platform_originator, currency: currency) }

  let(:token) { authentication["token"]["token"] }

  let(:client) { authentication["token"]["client"] }

  let(:expiry) { authentication["token"]["expiry"] }

  let(:user_loan) { create(:user_loan, user: user, loan: loan, user_account: user_account) }

  describe 'GET user_loans#index' do

    context 'when user is authenticated' do
      before do
        user_loan
        get api_v1_user_loans_path, params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @user_loans' do
        expect(assigns(:user_loans)).to eq([user_loan])
      end
    end

    context 'when user is not authenticated' do

      before do
        get api_v1_user_loans_path
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'POST user_loans#create' do

    context 'when user is authenticated' do
      before do
        post api_v1_user_loans_path, params: {uid: user.uid, "access-token": token, expiry: expiry, client: client, user_loan: {slice_name: "test", market: "primary", xirr: 67, invest_mode: "manual", position: "in", date_in: "2020-02-01", date_out: "2020-03-01", loan_id: loan.id, user_account_id: user_account.id}}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @user_loan' do
        expect(assigns(:user_loan)).to eq(UserLoan.first)
      end
    end

    context 'when user is not authenticated' do

      before do
        post api_v1_user_loans_path
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'PUT user_loans#update' do

    context 'when user is authenticated' do
      before do
        put api_v1_user_loan_path(user_loan), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client, user_loan: {slice_name: 'testloan'}}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'assigns @user_loan' do
        expect(assigns(:user_loan).slice_name).to eq('testloan')
      end
    end

    context 'when user is not authenticated' do

      before do
        put api_v1_user_loan_path(user_loan)
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'Delete user_loans#destroy' do

    context 'when user is authenticated' do
      before do
        delete api_v1_user_loan_path(user_loan), params: {uid: user.uid, "access-token": token, expiry: expiry, client: client}
      end

      it 'have status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'checks the content type' do
        expect(response.content_type).to eq("appliaction/vnd.api+json; charset=utf-8")
      end

      it 'checks the message' do
        expect(JSON(response.body)["message"]).to eq("User loan deleted")
      end
    end

    context 'when user is not authenticated' do

      before do
        delete api_v1_user_loan_path(user_loan)
      end

      it "have the status code 401" do
        expect(response).to have_http_status 401
      end
    end
  end
end