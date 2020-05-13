class ApplicationController <  ActionController::Base
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
    if current_api_v1_user.has_role?(:admin).equal?(false)
      render json: {success: false, code: 403, message: "Forbidden"}
    end
  end

  def admin_or_contributor!
    if !current_api_v1_user.has_role?(:user)
      render json: {success: false, code: 403, message: "Forbidden"}
    end
  end
end
