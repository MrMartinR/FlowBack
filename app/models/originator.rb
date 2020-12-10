class Originator < ApplicationRecord
  self.implicit_order_column = "created_at"

  INDIVIDUAL_CATEGORY = ["Personal","Consolidation", "Refinancing", "Short Term",
                         "Vehicle Pawnbroking", "Mortage", "Bridge"
  ]
  BUSINESS_CATEGORY = ["Agricultural",
                       "Invoice Trading",
                       "Consolidation Refinancing",
                       "Pawnbroking Mortage",
                       "Development",
                       "Growth",
                       "Working", "Capital Bridge"]

  CUSTOMER_TYPE = ["Companies", "Individual"]

  has_many :loans
  has_many :user_loans
  belongs_to :contact, optional: true

  validates :product_category_individuals, :inclusion=> { :in => INDIVIDUAL_CATEGORY,:message => 'is not included in the list : Personal,Consolidation, Refinancing, Short Term, Vehicle Pawnbroking, Mortage, Bridge' }
  validates :product_category_companies, :inclusion=> { :in => BUSINESS_CATEGORY,:message => 'is not included in the list : Agricultural, Invoice Trading, Consolidation Refinancing,Pawnbroking Mortage, Development, Growth, Working, Capital Bridge' }
  validates :customer_category, :inclusion=> { :in => BUSINESS_CATEGORY,:message => "is not included in the list : #{CUSTOMER_TYPE.join(', ')}"}
end
