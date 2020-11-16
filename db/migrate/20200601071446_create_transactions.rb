class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.uuid :country_id
      t.uuid :user_account_id
      t.uuid :user_account_related_id
      t.uuid :currency_id
      t.uuid :user_id
      t.uuid :loan_id
      t.uuid :property_id
      t.string :type
      t.string :ref
      t.date :date
      t.time :time
      t.string :category
      t.string :description
      t.float :amount
      t.text :notes
      t.integer :shares
      t.float :share_price

      t.timestamps
    end

    add_index :transactions, :country_id
    add_index :transactions, :user_account_id
    add_index :transactions, :user_account_related_id
    add_index :transactions, :currency_id
    add_index :transactions, :user_id
    add_index :transactions, :loan_id
    add_index :transactions, :property_id
    add_index :transactions, :type
  end
end
