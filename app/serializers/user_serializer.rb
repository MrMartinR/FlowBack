class UserSerializer
  include JSONAPI::Serializer

  set_type :users
  attributes :username, :uid, :email
end
