module ErrorSerializer
  def self.serialize(object)
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
