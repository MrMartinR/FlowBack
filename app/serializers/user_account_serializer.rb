class UserAccountSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :user_account
  #The attributes needed in response
  attributes :name, :active, :category


  belongs_to :country
  belongs_to :currency
  belongs_to :account
  belongs_to :user

  has_many :user_loans
  has_many :transactions
end