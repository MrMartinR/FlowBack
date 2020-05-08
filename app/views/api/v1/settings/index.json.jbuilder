json.success true

json.user do | |
  json.id @user.id
  json.email @user.email
  json.username @user.username
  json.country_id @user.country_id
  json.country_id @user.currency_id
end

