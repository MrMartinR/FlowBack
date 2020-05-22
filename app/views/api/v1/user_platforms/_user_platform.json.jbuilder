json.success true
json.data [user_platform] do | |
  json.extract! user_platform, :id, :user_id, :platform_id, :overview, :strategy, :user, :pass, :internal_id, :notes, :rating, :xirr, :total_loss, :air,
                :created_by, :updated_by
  json.url api_v1_user_platform_url(user_platform, format: :json)
end
