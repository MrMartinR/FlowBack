class RenameColumnTypeCurrencies < ActiveRecord::Migration[6.0]
  def change
    remove_column :currencies, :type
    add_column :currencies,:kind, :string
  end
end
