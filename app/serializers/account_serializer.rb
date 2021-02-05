class AccountSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :account
  #The attributes needed in response
  attributes  :category
end