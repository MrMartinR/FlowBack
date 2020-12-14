class AccountsJsonChangeUuid < ActiveRecord::Migration[6.0]
  def change
    remove_column :accounts, :country_id
    remove_column :accounts, :currency_id
    
    add_column :accounts, :country_id, :uuid
    add_column :accounts, :currency_id, :uuid
   
    
  end
end
