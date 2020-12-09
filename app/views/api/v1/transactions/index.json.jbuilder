json.success true

json.data @transactions do |transaction|
  json.id transaction.id
  json.user_account_id transaction.user_account_id
  json.transaction_related_id transaction.transaction_related_id
  json.user_id transaction.user_id
  json.loan_id transaction.loan_id
  json.property_id transaction.property_id
  json.ref transaction.ref
  json.date transaction.date
  json.time transaction.time
  json.category transaction.category
  json.description transaction.description
  json.amount transaction.amount
  json.notes transaction.notes
  json.shares transaction.shares
  json.share_price transaction.share_price

  json.country do
    json.id transaction.country.id
    json.name  transaction.country.name
    json.iso_code transaction.country.iso_code
    json.continent transaction.country.continent
    json.flag transaction.country.flag_image.attached?? rails_blob_path(transaction.country.flag_image) : nil
  end

  json.currency do
    json.id transaction.currency.id
    json.name transaction.currency.name
    json.code transaction.currency.code
    json.symbol transaction.currency.symbol
    json.decimal_places transaction.currency.decimal_places
    json.fx_eur transaction.currency.fx_eur
    json.type transaction.currency.kind
  end
end
