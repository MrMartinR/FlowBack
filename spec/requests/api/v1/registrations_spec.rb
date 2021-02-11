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
        expect(response_body).to eq(UserSerializer.new(User.last).serializable_hash.as_json)
      end

      it 'include the corrent type in response body' do
        expect(response_body).to have_type(:users)
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

      it 'include create failure details in the response error object' do
        expect(response_body).to have_error("can't be blank")
      end

      it 'return missing or mismatch type error when type is invalid' do
        invalid_attributes[:data][:type] = 'posts'
        post api_v1_user_registration_path, params: invalid_attributes

        expect(response_body).to have_error("Missing or mismatch 'type' in resource object")
      end

      it 'return missing top level data member' do
        invalid_attributes[:data] = nil
        post api_v1_user_registration_path, params: invalid_attributes

        expect(response_body).to have_error("Missing 'data' Member at document's top level")
      end
    end
  end

  describe 'PATCH /api/v1/registrations' do
    context 'when client sends valid updated attributes' do
      let(:user) { create(:user) }
      let(:valid_attributes) do
        {
          data: {
            id: user.id,
            type: 'users',
            attributes: {
              username: 'new name'
            }
          }
        }
      end

      before do
        auth_headers = user.create_new_auth_token
        patch api_v1_user_registration_path, params: valid_attributes, headers: auth_headers
      end

      it 'return status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'update the user data sent in response body' do
        expect(response_body['data']['attributes']['username']).to eq 'new name'
      end
    end

    context 'when client sends invalid updated attributes' do
      let(:user) { create(:user) }
      let(:invalid_attributes) do
        {
          data: {
            id: user.id,
            type: 'users',
            attributes: {
              username: 'ne'
            }
          }
        }
      end

      before do
        auth_headers = user.create_new_auth_token
        patch api_v1_user_registration_path, params: invalid_attributes, headers: auth_headers
      end

      it 'return status code 422 when id is missing' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'include update failure details in the response error object' do
        expect(response_body).to have_error('is too short (minimum is 3 characters)')
      end
    end
  end
end
