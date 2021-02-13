class Platform < ApplicationRecord
  self.implicit_order_column = 'created_at'

  has_many :user_platforms, dependent: :destroy
  has_many :loans, dependent: :destroy
  has_many :user_loans, dependent: :destroy
  has_many :accounts, dependent: :destroy
  belongs_to :contact
end
