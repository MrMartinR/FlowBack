# json.array! @accounts, partial: "accounts/account", as: :account
json.success true

json.data @accounts do |account|
  json.id account.id
  json.name account.name
  json.category account.category
  json.icon account.icon
  json.platform account.platform
end
