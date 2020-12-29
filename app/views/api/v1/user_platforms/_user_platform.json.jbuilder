json.success true
json.data [user_platform] do | |
  json.extract! user_platform, :id, :user, :platform, :overview, :strategy, :login_user, :login_pass, :internal_id, :notes, :rating,
                :created_by, :updated_by
end
