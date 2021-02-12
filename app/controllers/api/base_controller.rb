class Api::BaseController < ApplicationController
  include Response
  include ExceptionHandler
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_api_v1_user!
  before_action :validate_data_member, only: %i[update create]
  before_action :validate_resource_object_type, only: %i[update create]
  before_action :validate_resource_object_identifier, only: :update

  def update; end

  def create; end

  def current_user
    @current_user ||= current_api_v1_user
  end

  protected

  def admin_or_contributor!
    return if current_user.has_role?(:admin) || current_user.has_role?(:contributor)

    render json: { errors: [{ title: 'Forbidden', detail: 'Only admin or contributer is authorized' }] },
           status: :forbidden
  end

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
    if controller_name.in? user_related_controllers
      'users'
    else
      controller_name
    end
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
