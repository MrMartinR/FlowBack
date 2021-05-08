class Contact < ApplicationRecord
  self.implicit_order_column = 'created_at'
  # relation
  has_many :contact_methods
  belongs_to :country, optional: true
  belongs_to :user, optional: true
  has_one :account
  has_one :originator
  has_one :platform

  KIND_CATEGORY = %w[COMPANY INDIVIDUAL].freeze
  VISIBILITY_CATEGORY = %w[Public Private].freeze

  validates :kind, inclusion: { in: KIND_CATEGORY, message: 'is not included in the list : [Company, Individual]' }
  validates :visibility, inclusion: { in: VISIBILITY_CATEGORY, message: 'is not included in the list : [Public, Private]' }

  before_validation { self.kind = kind.upcase }
  before_validation { self.visibility = visibility.upcase }
end
