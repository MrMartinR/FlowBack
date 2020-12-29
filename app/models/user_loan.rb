class UserLoan < ApplicationRecord
  # notes :
  # xiir value
  # This is a calculated value (XIRR from the table transactions) % format, 2 decimals
  #
  # :invest_mode
  # Possible values: platform::invest_mode [Manual | Preset | Auto]
  #
  # :investment amount
  # This is a calculated value (Sum all transactions with Category = Investment) (positive value)
  #
  # :position
  # Possible values: [In | Out]
  #
  # :date_in
  # This is a calculated value. First value from transactions::date
  # where Category = Investment (Or the minimum date from transactions)
  # :date_out
  # This is a calculated value. Maximum date from transactions if user_loans::position = "Out"
  #
  # :principal_remaining
  # This is a calculated value (Sum all transactions with Category = Invest) - (sum all transactions with category Principal) or
  # investment_amount - sum all transactions with category "Principal"
  #
  # :interest, :bonus , :tax, :loss, :fee
  # Those are calculated values, sum all transactions based on transactions::category
  #
  # :contract_url
  # Is a document, mostly a pdf, but sometimes a .doc,  Will be thousands of them,
  # not sure about the average size,
  # but I guess it has to be saved in the filesystem, not in the database.
  # Nobody will view/download the file, the load speed is not relevant.
  # so, I guess this has to be a path to the file.


  MARKET_VALUES = ["Primary", "Secondary"]
  INVEST_MODE_VALUES = ["Manual", "Preset", "Auto"]
  POSITION_VALUES = ["In", "Out"]

  validates :market, inclusion: {in: MARKET_VALUES}
  validates :invest_mode, inclusion: {in: INVEST_MODE_VALUES}
  validates :position, inclusion: {in: POSITION_VALUES}
  validates :xirr, presence: true, format: {with: /\A\d+(?:\.\d{0,2})?\z/}, numericality: {greater_than: 0, less_than: 101}

  scope :by_user, -> (id_user) { where("user_id = ?", id_user) }

  # relation
  belongs_to :loan
  belongs_to :user_account


  # TODO
  def set_date_out
    # This is a calculated value. Maximum date from transactions if user_loans::position = "Out"
  end

  def set_principal_remaining

  end
end
