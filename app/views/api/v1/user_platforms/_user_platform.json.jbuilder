json.extract! user_platform, :id, :user_id, :platform_id, :overview, :strategy, :user, :pass, :internal_id, :notes, :rating, :xirr, :total_loss, :air, :created_at, :updated_at
json.url user_platform_url(user_platform, format: :json)
