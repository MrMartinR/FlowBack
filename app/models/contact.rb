class Contact < ApplicationRecord
  self.implicit_order_column = "created_at"
end
