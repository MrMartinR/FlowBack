module Helpers
  module JsonHelpers
    def response_body
      @response_body ||= JSON.parse(response.body)
    end
  end
end
