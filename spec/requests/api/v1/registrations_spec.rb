require 'rails_helper'

RSpec.describe 'Api::V1::Registrations', type: :request do
  describe 'POST /api/v1/registrations' do
    context 'when client sends valid attributes' do
      let(:valid_attributes) do
        {
          data: {
            type: 'users',
            attributes: {
              username: 'Joe',
              email: 'joe@example.com',
              password: '123456',
              password_confirmation: '123456',
              confirm_success_url: 'http://example.com/accounts'
            }
          }
        }
      end

      before do
        post api_v1_user_registration_path, params: valid_attributes
      end

      it 'return status code 201' do
        expect(response).to have_http_status(:ok)
      end

      it 'include a location header for the new user'
      it 'include an access_token and client and uid in the headers'
      it 'include the created user object in response body'
    end

    context 'when client sends invalid or missing attributes' do
      let(:invalid_attributes) do
        {
          data: {
            type: 'users',
            attributes: {
              username: 'Joe',
              password_confirmation: '123456'
            }
          }
        }
      end

      before do
        post api_v1_user_registration_path, params: invalid_attributes
      end

      it 'return status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
