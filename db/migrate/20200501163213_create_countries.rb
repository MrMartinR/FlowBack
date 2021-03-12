class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :iso_code
      t.string :continent
      t.integer :currency_id, index: true, foreign_key: true
      t.timestamps
    end
  end
end
