class Transaction < ApplicationRecord
  self.implicit_order_column = "created_at"
  self.inheritance_column = :_type_disabled

  belongs_to :country
  belongs_to :user_account
  #belongs_to :user_account_related
  belongs_to :currency
  belongs_to :user
  belongs_to :loan
  #belongs_to :property

  def self.transactions_list(params)
    user_account_id = params[:user_account_id]

    user_account_id.present? ? Transaction.where(user_account_id: user_account_id) : Transaction.all
  end
end
