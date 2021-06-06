class Platform < ApplicationRecord
  # self.implicit_order_column = 'created_at'

  has_many :user_platforms
  has_many :loans
  has_many :user_loans
  has_many :accounts
  has_many :platform_originators
  belongs_to :contact
end
