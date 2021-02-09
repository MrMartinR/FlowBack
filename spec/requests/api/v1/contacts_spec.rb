require 'rails_helper'

RSpec.describe 'Api::V1::Contacts', type: :request do
  describe 'GET /api/v1/contacts' do
    context 'when user is authenticated' do
      let(:user) { create(:user) }
      let!(:contacts) { create_list(:contact, 2, user: user) }

      before do
        auth_headers = user.create_new_auth_token
        get api_v1_contacts_path, headers: auth_headers
      end

      it 'return status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'return contacts list in response' do
        expect(response_body).to eq(ContactsSerializer.new(contacts).serializable_hash.as_json)
      end
    end

    context 'when user is not authenticated' do
      before do
        get api_v1_contacts_path
      end

      it 'return status code 401' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'include authentication errors in response body' do
        p response_body
        expect(response_body).to have_error('You need to sign in or sign up before continuing')
      end
    end
  end
end
