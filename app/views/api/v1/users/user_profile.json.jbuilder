json.success true
json.role @user.roles.try(:first).try(:name)

json.data [@user] do |user|
  json.id user.id
  json.email user.email
  json.username user.username
  json.name user.name
  json.surname user.surname
  json.dob date_format(user.dob)

  if @user.avatar&.attached?
    # json.avatar_url Rails.application.routes.url_helpers.rails_representation_url(user.avatar.variant(resize: "400x400").processed, only_path: true) rescue ""
    begin
      json.avatar_url 'https://api.flowfin.tech' + Rails.application.routes.url_helpers.rails_representation_url(
        user.avatar.variant(resize: '400x400').processed, only_path: true
      )
    rescue StandardError
      ''
    end
  else
    json.avatar_url gravatar_img_url(user.email)
  end

  if user.currency
    json.currency user.currency, :id, :name, :code, :symbol, :kind, :decimal_places
  else

    json.currency 'Not found'
  end

  if user.country
    json.country user.country, :id, :name, :iso_code
  else

    json.country 'Not found'
  end
end
