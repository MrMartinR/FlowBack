class Loan < ApplicationRecord
  self.implicit_order_column = "created_at"

  belongs_to :country
  belongs_to :currency
  belongs_to :originator
  belongs_to :platform
  has_many :user_loans
end
