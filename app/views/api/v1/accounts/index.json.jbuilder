# json.array! @accounts, partial: "accounts/account", as: :account
json.success true

json.data @accounts do |account|
  json.id account.id
  json.trade_name account.trade_name
  # json.category account.category
  # json.icon account.icon
  # json.platform account.platform
end
