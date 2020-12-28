class PlatformOriginator < ApplicationRecord
  belongs_to :originator
  belongs_to :platform
  has_many :loans
end
