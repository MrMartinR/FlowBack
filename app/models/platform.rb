class Platform < ApplicationRecord
   self.implicit_order_column = "created_at"

   has_many :user_platforms
   has_many :loans
   has_many :user_loans
end
