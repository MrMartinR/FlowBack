json.success true

json.data do | |
  json.id @user.id
  json.email @user.email
  json.username @user.username
  json.country_id @user.country_id
  json.currency_id @user.currency_id
end
