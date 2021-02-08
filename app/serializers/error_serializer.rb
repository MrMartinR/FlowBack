class ErrorSerializer
  attr_reader :resource, :errors

  def initialize(resource)
    @resource = resource
    @errors = errors_for(resource).flatten
  end

  def serialize
    { errors: errors }
  end

  private

  def build_error_object(field, error)
    {}.tap do |hash|
      hash[:status] = 422
      hash[:detail] = error
      hash[:source] = { pointer: "/data/attributes/#{field}" }
    end
  end

  def errors_for(resource)
    resource.errors.messages.map do |field, errors|
      errors.map do |error|
        build_error_object(field, error)
      end
    end
  end
end
