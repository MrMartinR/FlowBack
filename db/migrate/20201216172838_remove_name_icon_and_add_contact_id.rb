class RemoveNameIconAndAddContactId < ActiveRecord::Migration[6.0]
  def change
    remove_column :accounts, :name
    remove_column :accounts, :icon

    add_column :accounts, :contact_id, :uuid
  end
end
