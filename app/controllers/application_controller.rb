class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  protect_from_forgery unless: -> { request.format.json? }

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
end
