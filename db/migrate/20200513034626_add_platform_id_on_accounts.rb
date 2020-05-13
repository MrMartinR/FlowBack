class AddPlatformIdOnAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts,:platform_id , :uuid
    add_index :accounts, :currency_id
    add_index :accounts, :country_id
    add_index :accounts, :platform_id

  end
end
