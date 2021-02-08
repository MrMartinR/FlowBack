class ApplicationController < ActionController::Base
  include ExceptionHandler

  before_action :validate_data_member
  before_action :validate_resource_object_type
  before_action :validate_resource_object_identifier, except: :create
  protect_from_forgery with: :null_session
  protect_from_forgery unless: -> { request.format.json? }
  before_action :see_params

  def see_params
    # logger.info "-" * 10
    # logger.info request.headers['access-token']
    # logger.info request.headers['token-type']
    # logger.info request.headers['client']
    # logger.info request.headers['expiry']
    # logger.info request.headers['uid']
    # logger.info "*" * 10
  end

  protected

  def auth_admin!
    render json: { success: false, code: 403, message: 'Forbidden' } if current_api_v1_user.has_role?(:admin).equal?(false)
  end

  def admin_or_contributor!
    admin_or_contributor =
      (current_api_v1_user.present? && current_api_v1_user.has_role?(:admin).equal?(true)) ||
      (current_api_v1_user.present? && current_api_v1_user.has_role?(:contributor).equal?(true))
    render json: { success: false, code: 403, message: 'Forbidden' } if admin_or_contributor.equal?(false)
  end

  def validate_top_level_data_member
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
    controller_name == 'registrations' ? 'users' : controller_name
  end
end
