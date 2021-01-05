class Account < ApplicationRecord
  #  belongs_to :country
  #  belongs_to :currency
  belongs_to :platform
  belongs_to :contact

  #  validates :country_id , presence: true
  #  validates :currency_id , presence: true
  #  before_save :check_country_array
  #  before_save :check_currency_array

  # def check_country_array
  #   begin
  #   if Country.where("id in(?)", self.country_id).count == self.country_id.size
  #     puts "same size"
  #   else
  #     errors.add(:country_id, :blank, message: "Some Country ID not found !")
  #   end
  #   rescue ActiveRecord::StatementInvalid => e
  #     errors.add(:country_id, :blank, message: "Some Country ID not found !")
  #     end
  # end

  # def check_currency_array
  #   begin
  #   if Currency.where("id in(?)", self.currency_id).count == self.currency_id.size
  #     puts "same size"
  #   else
  #     errors.add(:currency_id, :blank, message: "Some Currency ID not found !")
  #   end
  #   rescue ActiveRecord::StatementInvalid => e
  #     errors.add(:currency_id, :blank, message: "Some Country ID not found !")
  #   end
  # end
end
