#json.array! @countries, partial: "api/v1/countries/country", as: :country
json.array! @countries do |country|
  json.id country.id
  json.name  country.name
  json.iso_code country.iso_code
  json.continent country.continent
  json.flag country.flag

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
