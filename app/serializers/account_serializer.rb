class AccountSerializer
    include JSONAPI::Serializer
  #sets the type of serializer
  set_type :account
  #The attributes needed in response
  attributes   :category

  #for platform_status attribute
  attribute :platform_status do |account|
    account.platform.status
  end
end