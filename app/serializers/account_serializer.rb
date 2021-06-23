class AccountSerializer
    include JSONAPI::Serializer

  #sets the type of serializer
  set_type :account
  #The attributes needed in response
  attributes   :category, :contact, :country_id, :currency_id

  #for platform_status attribute
  attribute :platform_status do |account|
    account.platform.status if account.platform
  end
end