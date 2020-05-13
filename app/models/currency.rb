class Currency < ApplicationRecord
  has_many :countries
  has_many :users
end
