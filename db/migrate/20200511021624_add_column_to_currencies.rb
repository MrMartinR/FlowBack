class AddColumnToCurrencies < ActiveRecord::Migration[6.0]
  def change
    add_column :currencies, :fx_eur, :float
  end
end
