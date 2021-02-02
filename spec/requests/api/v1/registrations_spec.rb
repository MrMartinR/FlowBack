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
              password_confirmation: '123456'
            }
          }
        }
      end

      before do
        post api_v1_user_registration_path, params: valid_attributes
      end

      it 'return status code 201' do
        expect(response).to have_http_status(:created)
      end

      it 'include a location header for the new user' do
        expect(response.location).to eq "/api/v1/users/#{User.last.id}"
      end

      it 'include the authentication information in the headers' do
        %w[access-token uid client expiry token-type].each do |info|
          expect(response.headers[info]).not_to be nil
        end
      end

      it 'include the created user in response body' do
        expect(JSON.parse(response.body))
          .to eq(UserSerializer.new(User.last).serializable_hash.as_json)
      end
    end

    context 'when client sends invalid or missing attributes' do
      let(:invalid_attributes) do
        {
          data: {
            type: 'users',
            attributes: {
              username: '',
              email: ''
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

      it 'return json error object' do
        expect(JSON.parse(response.body)).to have_jsonapi_error_format
      end
    end
  end
end
