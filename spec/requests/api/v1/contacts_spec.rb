require 'rails_helper'

RSpec.describe 'Api::V1::Contacts', type: :request do
  describe 'GET /api/v1/contacts' do
    context 'when user is authenticated' do
      let(:user) { create(:user) }
      let!(:contacts) { create_list(:public_contact, 2, user: user) }

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
        expect(response_body).to have_error('You need to sign in or sign up before continuing')
      end
    end
  end

  describe 'POST /api/v1/contacts' do
    context 'when a normal users creates a public contact' do
      let(:user) { create(:user) }
      let(:contact_attributes) do
        {
          data:
          {
            type: 'contacts',
            attributes: FactoryBot.attributes_for(:public_contact)
          }
        }
      end

      before do
        auth_headers = user.create_new_auth_token
        post api_v1_contacts_path, params: contact_attributes, headers: auth_headers
      end

      it 'return status code 403' do
        expect(response).to have_http_status(:forbidden)
      end

      it 'include authorization error in response body' do
        expect(response_body).to have_error('Only admin or contributer can create a public contact')
      end
    end

    context 'when a normal users creates a private contact' do
      let(:user) { create(:user) }
      let(:contact_attributes) do
        {
          data:
          {
            type: 'contacts',
            attributes: FactoryBot.attributes_for(:private_contact)
          }
        }
      end

      before do
        auth_headers = user.create_new_auth_token
        post api_v1_contacts_path, params: contact_attributes, headers: auth_headers
      end

      it 'return status code 201' do
        expect(response).to have_http_status(:created)
      end

      it 'include the created contact in response body' do
        expect(response_body).to eq(ContactsSerializer.new(Contact.last).serializable_hash.as_json)
      end

      it 'include location header for the newly created contact' do
        expect(response.location).to eq "/api/v1/contacts/#{Contact.last.id}"
      end
    end

    context 'when admin or contributer creates a public contact' do
      let(:admin) { create(:admin) }
      let(:contact_attributes) do
        {
          data: {
            type: 'contacts',
            attributes: FactoryBot.attributes_for(:public_contact)
          }
        }
      end

      before do
        auth_headers = admin.create_new_auth_token
        post api_v1_contacts_path, params: contact_attributes, headers: auth_headers
      end

      it 'return status code 201' do
        expect(response).to have_http_status(:created)
      end

      it 'include location header for the newly created contact' do
        expect(response.location).to eq "/api/v1/contacts/#{Contact.last.id}"
      end

      it 'return the created contact in response body' do
        expect(response_body).to eq(ContactsSerializer.new(Contact.last).serializable_hash.as_json)
      end
    end

    context 'when user attempts to create contact with invalid attributes' do
      let(:user) { create(:user) }
      let(:contact_attributes) do
        {
          data: {
            type: 'contacts',
            attributes: attributes_for(:private_contact)
          }
        }
      end

      before do
        auth_headers = user.create_new_auth_token
        contact_attributes[:data][:attributes][:visibility] = 'invalid_visibility_option'

        post api_v1_contacts_path, params: contact_attributes, headers: auth_headers
      end

      it 'return status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'return error describing errors happened on contact creation' do
        expect(response_body).to have_error('is not included in the list : [Public, Private]')
      end
    end
  end

  describe 'PATCH /api/v1/contacts' do
    context 'when a user updates a public contact' do
      let(:user) { create(:user) }
      let(:contact) { create(:public_contact, company_name: 'flow') }
      let(:contact_attributes) do
        {
          data: {
            type: 'contacts',
            id: contact.id,
            attributes: attributes_for(:contact)
          }
        }
      end

      before(:each, admin: true) do
        user.add_role(:admin)
      end

      before do
        auth_headers = user.create_new_auth_token
        patch api_v1_contact_path(contact), params: contact_attributes, headers: auth_headers
      end

      it 'return status code 403' do
        expect(response).to have_http_status(:forbidden)
      end

      it 'return authorization error in response body' do
        expect(response_body).to have_error('Only admin or contributer can update a public contact')
      end

      it 'return status code 200', admin: true do
        expect(response).to have_http_status(:ok)
      end

      it 'update the contact record if the user is admin', admin: true do
        expect(response_body['data']['attributes']['company_name']).to eq 'tesla'
      end
    end
  end

  describe 'DELETE /api/v1/contacts' do
    context 'when contact is successfully destroyed' do
      let(:user) { create(:user) }
      let(:contact) { create(:public_contact) }

      before do
        auth_headers = user.create_new_auth_token
        delete api_v1_contact_path(contact), headers: auth_headers
      end

      it 'return 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns meta object to specify that contact is deleted' do
        expect(response_body).to have_meta('message', 'Contact successfully deleted')
      end
    end

    context 'when is contact does not get destroyed' do
      let(:user) { create(:user) }

      before do
        auth_headers = user.create_new_auth_token
        delete api_v1_contact_path('not-a-real-id'), headers: auth_headers
      end

      it 'return 404 code if contact not found' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns errors object if record not found' do
        expect(response_body).to have_error(/Couldn't find Contact with 'id'/)
      end
    end
  end
end
