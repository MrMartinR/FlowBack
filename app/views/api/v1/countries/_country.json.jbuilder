json.extract! country, :id, :name, :iso_code, :continent, :flag
json.extract! country.currency do |x|
  json.currency_id x.id

end
json.url api_v1_country_url(country, format: :json)
