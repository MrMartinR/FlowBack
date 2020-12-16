class Contact < ApplicationRecord
  self.implicit_order_column = "created_at"
  # relation
  has_many :contact_methods
  has_many :originators
  belongs_to :country, optional: true
  belongs_to :user, optional: true
  has_one :account
  has_one :originators
  has_one :platform

  KIND_CATEGORY =  %W(COMPANY INDIVIDUAL)
  VISIBILITY_CATEGORY = %W(PUBLIC PRIVATE)

  validates :kind, :inclusion=> { :in => KIND_CATEGORY,:message => "is not included in the list : [Company, Individual]" }
  validates :visibility, :inclusion=> { :in => VISIBILITY_CATEGORY,:message => "is not included in the list : [Public, Private]"  }

  before_validation { self.kind = self.kind.upcase }
  before_validation { self.visibility = self.visibility.upcase }
end
