class RemoveIconLogo < ActiveRecord::Migration[6.0]
  def change
    remove_column :originators, :logo
    remove_column :originators, :icon
  end
end
