# json.id @user.id
# json.email @user.email
# json.username @user.username
# if @user.currency
#   json.currency @user.currency, :id, :name
# else
#   json.currency "Not found"
# end

# if @user.country
#   json.country @user.country, :id, :name
# else
#   json.country "Not found"
# end
# json.gravatar_url gravatar_img_url('mbainurb@gmail.com')
# json.flag @user.avatar.attached?? rails_blob_path(country.flag_image) : nil

json.data [@user] do |user|
  json.id user.id
  json.email user.email
  json.username user.username
  if user.currency
    json.currency user.currency, :id, :name
  else
    json.currency 'Not found'
  end

  if user.country
    json.country user.country, :id, :name
  else
    json.country 'Not found'
  end
end
