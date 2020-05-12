class Api::BaseController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  protected

  rescue_from ActionController::ParameterMissing do |e|
    render json: {success: false, code: 400, message: "Bad request"}
  end

  rescue_from ActiveRecord::RecordInvalid do |invalid|
    render json: {success: false, code: 400, message: "#{invalid.record.errors.messages}"}
  end


  def auth_admin!
    if current_api_v1_user.has_role?(:admin) == false
      render json: {success: false, code: 403, message: "Forbidden"}
    end
  end

end