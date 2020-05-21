class Account < ApplicationRecord
  belongs_to :country
  belongs_to :currency

  validates :country_id , presence: true
  validates :currency_id , presence: true
end
