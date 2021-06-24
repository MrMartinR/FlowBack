class UserAccountSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :user_account
  #The attributes needed in response
  attributes :name, :active, :category, :country, :account, :currency, :user, :user_loans

  has_many :transactions
end