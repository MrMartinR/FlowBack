api_mime_types = %w[
  application/vnd.api+json
  text/x-json
  application/json
]

Mime::Type.register 'appliaction/vnd.api+json', :json, api_mime_types
