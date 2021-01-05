json.success true

json.data [@country] do |country|
  json.id country.id
  json.name country.name
  json.iso_code country.iso_code
  json.continent country.continent
  json.flag country.flag_image.attached? ? rails_blob_path(country.flag_image) : nil

  json.currency do
    json.id country.currency.id
    json.name country.currency.name
    json.code country.currency.code
    json.symbol country.currency.symbol
    json.decimal_places country.currency.decimal_places
    json.fx_eur country.currency.fx_eur
    json.type country.currency.kind
  end
end
