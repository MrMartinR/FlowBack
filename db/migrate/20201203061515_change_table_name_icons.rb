class ChangeTableNameIcons < ActiveRecord::Migration[6.0]
  def change
    rename_table :icons, :image_assets
  end
end
