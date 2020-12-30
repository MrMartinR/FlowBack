#json.array! @countries, partial: "api/v1/countries/country", as: :country
json.success true

json.data @users do |user|
  json.id user.id
  json.email user.email
  json.username user.username
  if user.currency
    json.currency user.currency, :id , :name
  else
    json.currency "Not found"
  end

  if user.country
    json.country user.country, :id , :name
  else
    json.country "Not found"
  end

end
