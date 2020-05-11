#json.array! @countries, partial: "api/v1/countries/country", as: :country
json.success true

json.users @users do |user|
  json.id user.id
  json.email user.email
  json.username user.username
  #json.currency_id user.currency_id
  #json.country_id user.country_id
  if user.currency
    json.currency user.currency, :id , :name
  end

  if user.country
    json.country user.country, :id , :name
  end

end

json.page @page
json.total_pages @total_pages
