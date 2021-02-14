class UserPlatformsSerializer
  include JSONAPI::Serializer

  attributes :user_id, :platform, :strategy, :login_user, :internal_id,
             :notes, :rating, :created_by, :updated_by, :created_at, :overview
end
