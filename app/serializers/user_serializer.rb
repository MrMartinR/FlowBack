class UserSerializer
  include JSONAPI::Serializer
  set_type :user
  attributes :email, :username
  belongs_to :country
  belongs_to :currency
end
