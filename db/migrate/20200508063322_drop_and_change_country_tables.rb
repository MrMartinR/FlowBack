class DropAndChangeCountryTables < ActiveRecord::Migration[6.0]
  def change
    connection.execute 'drop table if exists countries'

    create_table :countries do |t|
      t.string :name
      t.string :iso_code
      t.string :continent
      t.uuid :currency_id,index: true, foreign_key: true
      t.string :flag
      t.timestamps
    end
  end
end
