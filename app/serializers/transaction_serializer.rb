class TransactionSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :transaction
  #The attributes needed in response
  attributes :user_account, :loan, :kind, :ref, :date, :time, :category, :description, :amount, :notes, :shares, :share_price
end