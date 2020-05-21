class CreateUserAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_accounts, id: :uuid do |t|
      t.uuid :country_id,index: true, foreign_key: true
      t.uuid :account_id,index: true, foreign_key: true
      t.uuid :platform_id,index: true, foreign_key: true
      t.uuid :currency_id,index: true, foreign_key: true
      t.uuid :user_id,index: true, foreign_key: true
      t.string :category
      t.string :name
      t.float :total_fee
      t.float :total_loss
      t.float :total_tax
      t.boolean :active
      t.float :total_invest
      t.float :total_profit
      t.float :total_referral
      t.float :total_interest
      t.float :total_bonus

      t.timestamps
    end
  end
end
