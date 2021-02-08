class ErrorSerializer
  attr_reader :object

  def initialize(object)
    @object = object
  end

  def serialize
    object.errors.messages.each_with_object({ errors: [] }) do |(field, errors), result|
      errors.each do |error|
        result[:errors] << {
          status: 422,
          detail: error,
          source: { pointer: "/data/attributes/#{field}" }
        }
      end
    end
  end
end
