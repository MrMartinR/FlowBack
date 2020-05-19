class UserAccount < ApplicationRecord
  belongs_to :country
  belongs_to :currency
  belongs_to :account
  belongs_to :user
  belongs_to :platform
end
