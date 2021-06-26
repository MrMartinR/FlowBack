class TransactionSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :transaction
  #The attributes needed in response
  attributes  :kind, :ref, :date, :time, :category, :description, :amount, :notes, :shares, :share_price

  # Relationship
  belongs_to :user_account
  belongs_to :loan
end