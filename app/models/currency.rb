class Currency < ApplicationRecord
  has_many :countries
  has_many :users
  has_many :accounts
end