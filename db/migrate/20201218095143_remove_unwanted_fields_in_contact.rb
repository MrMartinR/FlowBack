class RemoveUnwantedFieldsInContact < ActiveRecord::Migration[6.0]
  def change
    remove_column :contacts, :category
  end
end
