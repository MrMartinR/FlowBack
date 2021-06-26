class UserLoanSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :user_loan
  #The attributes needed in response
  attributes  :slice_name, :market, :xirr, :investment_amount, :invest_mode, :position, :date_in, :date_out

  # relation
  belongs_to :loan
  belongs_to :user
  belongs_to :user_account

  attribute :transactions do |object|
    object.user_account.transactions.where(loan_id: object.loan_id)
  end
end