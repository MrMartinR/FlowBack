json.success true

json.data [@account] do
  json.id @account.id
  json.category @account.category
  json.platform_status @account.platform.status
end
