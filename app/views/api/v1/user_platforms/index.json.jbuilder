#json.array! @user_platforms, partialjson. "user_platforms/user_platform", asjson. json.user_platform
json.success true

json.data @user_platforms do |user_platform|
  json.id user_platform.id
  json.user_id user_platform.user_id
  json.platform_id user_platform.platform_id
  json.overview user_platform.overview
  json.strategy user_platform.strategy
  json.user user_platform.user_id
  json.pass user_platform.pass
  json.internal_id user_platform.internal_id
  json.notes user_platform.notes
  json.rating user_platform.rating
  json.xirr user_platform.xirr
  json.total_loss user_platform.total_loss
  json.air user_platform.air
end
