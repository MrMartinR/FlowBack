json.id @user.id
json.email @user.email
json.username @user.username
json.name @user.name
json.surname @user.surname
json.dob date_format(@user.dob)

json.avatar_url @user.avatar.attached? ? Rails.application.routes.url_helpers.rails_representation_url(@user.avatar.variant(resize: "400x400").processed, only_path: true)  : gravatar_img_url(@user.email)
if @user.currency
  json.currency @user.currency, :id, :name, :code, :symbol, :kind, :decimal_places
else
  json.currency nil
end

if @user.country
  json.country @user.country, :id, :name, :iso_code
else
  json.country nil
end


