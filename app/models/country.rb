class Country < ApplicationRecord
  has_one_attached :flag_image

  belongs_to :currency, optional: true
  has_many :users
  has_many :accounts
  has_many :user_accounts
  has_many :loans
end
