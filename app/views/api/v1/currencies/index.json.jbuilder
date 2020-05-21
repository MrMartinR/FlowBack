#json.array! @currencies, partial: "api/v1/currencies/currency", as: :currency
json.success true
json.data @currencies do |currency|
  json.id currency.id
  json.name currency.name
  json.code currency.code
  json.symbol currency.symbol
  json.decimal_places currency.decimal_places
  json.fx_eur currency.fx_eur
  json.type currency.kind
end
