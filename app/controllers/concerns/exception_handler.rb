module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ success:false, message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ success:false, message: e.message }, :unprocessable_entity)
    end

    rescue_from ActionController::ParameterMissing do |e|
      #render json: {success: false, code: 400, message: "Bad request"}
      json_response({ success:false, message: e.message }, :bad_request)
    end
  end
end