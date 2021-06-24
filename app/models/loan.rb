class Loan < ApplicationRecord
  self.implicit_order_column = 'created_at'

  belongs_to :country
  belongs_to :currency
  has_many :user_loans
  belongs_to :platform_originator

  has_many :transactions
end
