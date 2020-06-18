#json.array! @accounts, partial: "accounts/account", as: :account
json.success true

json.data  @accounts do |account|
  json.id account.id
  json.name  account.name
  json.category account.category
  json.icon account.icon

  # if account.currency_id
  #   #json.currency account.currency, :id, :name
  #   json.currency_id
  # else
  #   json.currency nil
  # end
  json.currency_id account.currency_id

  json.country_id account.country_id
end

if params[:page]
json.page params[:page]
json.total_pages @total_pages
end








