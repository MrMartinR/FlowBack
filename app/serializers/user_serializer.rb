class UserSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :user
  #The attributes needed in response
  attributes :email, :username
  #Serializer for associatations
  belongs_to :country
  belongs_to :currency
end
