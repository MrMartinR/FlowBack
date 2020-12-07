class AddColumnHousekeeper < ActiveRecord::Migration[6.0]
  def change
    # transactions
    add_column :transactions, :created_by, :uuid
    add_column :transactions, :updated_by, :uuid
  end
end
