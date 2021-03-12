class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies, id: :uuid do |t|
      t.string :name
      t.string :code
      t.string :symbol
      t.string :type
      t.integer :decimal_places

      t.timestamps
    end
  end
end
