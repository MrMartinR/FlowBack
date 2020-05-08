json.extract! country, :id, :currency_id, :name, :iso_code, :continent, :flag, :created_at, :updated_at
json.url country_url(country, format: :json)
