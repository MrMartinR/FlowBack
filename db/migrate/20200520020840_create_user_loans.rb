class CreateUserLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :user_loans, id: :uuid do |t|
      t.uuid :country_id
      t.uuid :loan_id
      t.uuid :user_id
      t.uuid :currency_id
      t.uuid :originator_id
      t.uuid :user_account_id
      t.uuid :platform_id
      t.string :slice_name
      t.string :market
      t.float :xirr
      t.float :investment_amount
      t.string :invest_mode
      t.string :position
      t.date :date_in
      t.date :date_out
      t.float :principal_remaining
      t.float :interest
      t.float :bonus
      t.float :tax
      t.float :loss
      t.float :fee
      t.string :contract_url

      t.timestamps
    end

    add_index :user_loans, :country_id
    add_index :user_loans, :loan_id
    add_index :user_loans, :user_id
    add_index :user_loans, :currency_id
    add_index :user_loans, :originator_id
    add_index :user_loans, :user_account_id
    add_index :user_loans, :platform_id
  end
end
