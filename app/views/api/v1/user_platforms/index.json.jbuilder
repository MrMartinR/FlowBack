#json.array! @user_platforms, partialjson. "user_platforms/user_platform", asjson. json.user_platform
json.success true

json.data @user_platforms do |user_platform|
  json.id user_platform.id
  json.user_id
  json.platform_id,
  json.overview,
  json.strategy,
  json.user,
  json.pass,
  json.internal_id,
  json.notes,
  json.rating,
  json.xirr,
  json.total_loss,
  json.air
end
