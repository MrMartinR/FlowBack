class RemoveUnwantedFieldsFromTransations < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :currency_id
    remove_column :transactions, :user_account_related_id
    remove_column :transactions, :country_id
    remove_column :transactions, :user_id
  end
end


