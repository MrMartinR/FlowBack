class Contact < ApplicationRecord
  self.implicit_order_column = "created_at"

  KIND_CATEGORY =  %W(COMPANY INDIVIDUAL)
  VISIBILITY_CATEGORY = %W(PUBLIC PRIVATE)

  validates :kind, :inclusion=> { :in => KIND_CATEGORY,:message => "is not included in the [Company, Individual]" }
  validates :visibility, :inclusion=> { :in => VISIBILITY_CATEGORY }

  before_validation { self.kind = self.kind.upcase }
  before_validation { self.visibility = self.visibility.upcase }
end
