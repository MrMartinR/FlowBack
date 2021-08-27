class UserLoanSerializer
  include JSONAPI::Serializer

  # sets the type of serializer
  set_type :user_loan # optional

  # sets the id of serializer
  set_id :id # optional

  # links
  link :self, :url do |object| 
    "/user_loans/#{object.id}"  
    end

  # attributes
  attributes  :slice_name, :market, :xirr, :investment_amount, :invest_mode, :position, :date_in, :date_out


  # relation
  belongs_to :loan
  belongs_to :user
  belongs_to :user_account

  # attribute :transactions do |object|
  #   object.user_account.transactions.where(loan_id: object.loan_id)
  # end
end

