#json.array! @accounts, partial: "accounts/account", as: :account
json.success true

json.data  @accounts do |account|
  json.id account.id
  json.name  account.name
  json.category account.category
  json.icon account.icon

  if account.currency
    json.currency account.currency, :id, :name
  else
    json.currency nil
  end

  if account.country
    json.country account.country, :id, :name
  else
    json.country nil
  end
end

if params[:page]
json.page params[:page]
json.total_pages @total_pages
end








