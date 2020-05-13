#json.partial! "@accounts/@account", @account: @@account
json.id @account.id
json.name  @account.name

json.currency @account.currency do |currency|
  json.id currency.id
  json.name currency.name
  json.code currency.code
  json.symbol currency.symbol
  json.decimal_places currency.decimal_places
  json.fx_eur currency.fx_eur
  json.type currency.kind
end
json.country @account.country do |country|
  json.id country.id
  json.name  country.name
  json.iso_code country.iso_code
  json.continent country.continent
  json.flag country.flag_image.attached?? rails_blob_path(country.flag_image) : nil
end
json.category @account.category
json.icon @account.icon
