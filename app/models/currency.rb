class Currency < ApplicationRecord
  has_many :countries
  has_many :users
  has_many :accounts
  has_many :user_accounts
end
