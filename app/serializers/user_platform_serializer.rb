class UserPlatformSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :user_platform
  #The attributes needed in response
  attributes :user, :strategy, :login_user, :login_pass, :internal_id, :rating, :notes

  #for serializing platform
  attribute :platform do |user_platform|
    user_platform.platform
  end
end