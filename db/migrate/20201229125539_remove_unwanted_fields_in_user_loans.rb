class RemoveUnwantedFieldsInUserLoans < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_loans, :country_id
    remove_column :user_loans, :currency_id
    remove_column :user_loans, :originator_id
    remove_column :user_loans, :platform_id
    remove_column :user_loans, :user_id
    remove_column :user_loans, :contract_url
    remove_column :user_loans, :principal_remaining
    remove_column :user_loans, :interest
    remove_column :user_loans, :bonus
    remove_column :user_loans, :tax
    remove_column :user_loans, :loss
    remove_column :user_loans, :fee
  end
end
