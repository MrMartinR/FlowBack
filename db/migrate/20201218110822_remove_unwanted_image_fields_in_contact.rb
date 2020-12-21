class RemoveUnwantedImageFieldsInContact < ActiveRecord::Migration[6.0]
  def change
    remove_column :contacts, :has_icon
    remove_column :contacts, :has_logo
    remove_column :contacts, :has_picture
  end
end
