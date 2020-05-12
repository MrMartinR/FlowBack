json.id @user.id
json.email @user.email
json.username @user.username
if @user.currency
  json.currency @user.currency, :id, :name
end

if @user.country
  json.country @user.country, :id, :name
end
json.gravatar_url @user.avatar.attached?? rails_blob_path(@user.avatar) : gravatar_img_url(@user.email)


