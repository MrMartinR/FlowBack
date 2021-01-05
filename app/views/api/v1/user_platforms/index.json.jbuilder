# json.array! @user_platforms, partialjson. "user_platforms/user_platform", asjson. json.user_platform
json.success true

json.data @user_platforms do |user_platform|
  json.id user_platform.id
  json.user user_platform.user
  json.platform user_platform.platform
  json.overview user_platform.overview
  json.strategy user_platform.strategy
  json.login_user user_platform.login_user
  json.login_pass user_platform.login_pass
  json.internal_id user_platform.internal_id
  json.notes user_platform.notes
  json.rating user_platform.rating
end
