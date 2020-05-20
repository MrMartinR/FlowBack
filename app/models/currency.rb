class Currency < ApplicationRecord
  has_many :countries
  has_many :users
  has_many :accounts
  has_many :user_accounts
  has_many :loans
  has_many :user_loans
end
