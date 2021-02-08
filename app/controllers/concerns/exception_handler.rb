module ExceptionHandler
  include Response
  extend ActiveSupport::Concern

  class MissingDataMember < StandardError
    def initialize(message = "Missing 'data' Member at document's top level")
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
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ success: false, message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ success: false, message: e.message }, :unprocessable_entity)
    end

    rescue_from ActionController::ParameterMissing do |e|
      # render json: {success: false, code: 400, message: "Bad request"}
      json_response({ success: false, message: e.message }, :bad_request)
    end
  end
end
