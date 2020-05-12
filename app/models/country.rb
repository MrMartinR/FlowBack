class Country < ApplicationRecord
  has_one_attached :flag_image

  belongs_to :currency
  has_many :users
end
