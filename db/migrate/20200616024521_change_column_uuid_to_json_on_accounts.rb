class ChangeColumnUuidToJsonOnAccounts < ActiveRecord::Migration[6.0]
  def change
    remove_column :accounts,:currency_id
    remove_column :accounts, :country_id

    add_column :accounts, :currency_id, :json
    add_column :accounts, :country_id, :json
  end
end
