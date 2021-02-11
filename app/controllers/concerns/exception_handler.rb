module ExceptionHandler
  extend ActiveSupport::Concern

  class MissingDataMember < StandardError
    def initialize(message = "Missing 'data' Member at document's top level")
      super(message)
    end
  end

  class MissingIdentifierResourceObject < StandardError
    def initialize(message = "Missing 'id' in resource object")
      super(message)
    end
  end

  class MissingOrMismatchTypeResourceObject < StandardError
    def initialize(message = "Missing or mismatch 'type' in resource object")
      super(message)
    end
  end

  included do
    rescue_from ActionController::UnpermittedParameters do |error|
      message = "Invalid parameter: #{error.params.to_sentence}"
      message << 'Please verify that the parameter name is valid and the values are the correct type.'
      render json: { errors: [{ title: 'params error', message: message }] },
             status: :bad_request
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { errors: [{ detail: e.message }] },
             status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ success: false, message: e.message }, :unprocessable_entity)
    end

    rescue_from ActionController::ParameterMissing do |e|
      # render json: {success: false, code: 400, message: "Bad request"}
      json_response({ success: false, message: e.message }, :bad_request)
    end

    rescue_from ExceptionHandler::MissingDataMember do |e|
      render json: { errors: [{ status: '400', detail: e.message }] },
             status: :bad_request
    end

    rescue_from ExceptionHandler::MissingIdentifierResourceObject do |e|
      render json: { errors: [{ status: '400', detail: e.message }] },
             status: :bad_request
    end

    rescue_from ExceptionHandler::MissingOrMismatchTypeResourceObject do |e|
      render json: { errors: [{ status: '400', detail: e.message }] },
             status: :bad_request
    end
  end
end
