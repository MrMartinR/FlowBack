json.success true

json.data [@account] do | |
  json.id @account.id
  json.category @account.category
  json.platform_status @account.platform.status

  # if @account.currency_id
  #   #json.currency @account.currency, :id, :name
  #   json.currency_id @account.currency_id
  # else
  #   json.currency nil
  # end

  # if @account.country_id
  #   #json.country @account.country, :id, :name
  #   json.country_id @account.country_id
  # else
  #   json.country nil
  # end
end
