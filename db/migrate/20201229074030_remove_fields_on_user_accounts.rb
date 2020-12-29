class RemoveFieldsOnUserAccounts < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_accounts, :platform_id
    remove_column :user_accounts, :total_fee
    remove_column :user_accounts, :total_loss
    remove_column :user_accounts, :total_tax
    remove_column :user_accounts, :total_invest
    remove_column :user_accounts, :total_profit
    remove_column :user_accounts, :total_referral
    remove_column :user_accounts, :total_interest
    remove_column :user_accounts, :total_bonus

  end
end
