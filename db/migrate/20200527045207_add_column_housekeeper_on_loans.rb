class AddColumnHousekeeperOnLoans < ActiveRecord::Migration[6.0]
  def change
    add_column :loans,:created_by, :uuid
    add_column :loans,:updated_by, :uuid
  end
end
