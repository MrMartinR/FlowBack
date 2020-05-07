class ApplicationController <  ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  before_action :see_params

  include DeviseTokenAuth::Concerns::SetUserByToken

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

end
