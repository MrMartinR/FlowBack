class Api::BaseController < ApplicationController
  include Response
  include ExceptionHandler
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_api_v1_user!
  before_action :validate_data_member, except: :index
  before_action :validate_resource_object_type, except: :index
  before_action :validate_resource_object_identifier, except: %i[index create]

  def index; end

  def create; end

  def current_user
    @current_user ||= current_api_v1_user
  end

  protected

  def validate_data_member
    raise MissingDataMember if params[:data].nil?
  end

  def validate_resource_object_type
    raise MissingOrMismatchTypeResourceObject if
    params[:data][:type].nil? || params[:data][:type] != current_controller
  end

  def validate_resource_object_identifier
    raise MissingIdentifierResourceObject if params[:data][:id].nil?
  end

  def current_controller
    user_related_controllers = %w[registrations sessions]
    p controller_name
    controller_name.in? user_related_controllers ? 'users' : controller_name
  end

  def render_authenticate_error
    error = {
      status: '401',
      detail: 'You need to sign in or sign up before continuing'
    }

    render json: { errors: [error] },
           status: :unauthorized
  end
end
