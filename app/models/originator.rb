class Originator < ApplicationRecord
  self.implicit_order_column = 'created_at'

  CONSUMER_CATEGORY = ['Personal', 'Debt Consolidation', 'Short Term',
                       'Vehicle', 'Pawnbroking', 'Mortage', 'Bridge'].freeze
  BUSINESS_CATEGORY = ['Agricultural',
                       'Invoice Trading',
                       'Debt Consolidation',
                       'Pawnbroking',
                       'Mortage',
                       'Real Estate',
                       'Growth',
                       'Working Capital',
                       'Bridge'].freeze

  CUSTOMER_TYPE = %w[Business Consumer].freeze

  has_many :loans
  has_many :user_loans
  belongs_to :contact, optional: true

  validates :product_category_consumer,
            inclusion: { in: CONSUMER_CATEGORY,
                         message: 'is not included in the list : Personal,Debt Consolidation,  Short Term, Vehicle , Pawnbroking, Mortage, Bridge' }
  validates :product_category_business,
            inclusion: { in: BUSINESS_CATEGORY,
                         message: 'is not included in the list : Agricultural, Invoice Trading, Dept Consolidation,Pawnbroking, Mortage, Real Estate, Growth, Working Capital,Bridge' }
  validates :customer_category,
            inclusion: { in: CUSTOMER_TYPE, message: "is not included in the list : #{CUSTOMER_TYPE.join(', ')}" }
end
