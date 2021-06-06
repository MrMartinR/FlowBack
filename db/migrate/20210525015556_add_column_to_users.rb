class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :kanban, :jsonb
    add_column :users, :preferences, :jsonb
  end
end
