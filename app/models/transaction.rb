class Transaction < ApplicationRecord
  self.implicit_order_column = "created_at"
  self.inheritance_column = :_type_disabled

  belongs_to :user_account
  belongs_to :loan
  # belongs_to :property
end
