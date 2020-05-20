class Loan < ApplicationRecord
  belongs_to :country
  belongs_to :currency
  belongs_to :originator
  belongs_to :platform
end
