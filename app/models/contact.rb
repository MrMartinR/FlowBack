class Contact < ApplicationRecord
  self.implicit_order_column = 'created_at'
  # relation
  has_many :contact_methods
  belongs_to :country, optional: true
  belongs_to :user, optional: true
  has_one :account
  has_one :originator
  has_one :platform
end
