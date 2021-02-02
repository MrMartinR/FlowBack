class UserSerializer
  include JSONAPI::Serializer
  singleton_class.include Rails.application.routes.url_helpers

  set_type :users
  attributes :username, :uid, :email

  link :self do |object|
    api_v1_user_path(object)
  end
end
