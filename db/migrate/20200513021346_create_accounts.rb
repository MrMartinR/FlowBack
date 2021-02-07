class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.uuid :currency_id
      t.uuid :country_id
      t.string :category
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
