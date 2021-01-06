class ContactMethod < ApplicationRecord
  # relation
  belongs_to :contact

  VISIBILITY_CATEGORY = %w[PUBLIC PRIVATE].freeze

  validates :visibility, inclusion: { in: VISIBILITY_CATEGORY, message: 'is not included in the list : [Public, Private]' }

  before_validation { self.visibility = visibility.upcase }
end
