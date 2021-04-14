class AccountSerializer
    include JSONAPI::Serializer
  #sets the type of serializer
  set_type :account
  #The attributes needed in response
  attributes   :category, :contact

  #for platform_status attribute
  attribute :platform_status do |account|
    account.platform.status if account.platform
  end
end