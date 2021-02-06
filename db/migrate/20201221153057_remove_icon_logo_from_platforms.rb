class RemoveIconLogoFromPlatforms < ActiveRecord::Migration[6.0]
  def change
    # remove_column :platforms, :icon
    # remove_column :platforms, :logo

    add_column :platforms, :sm_notes, :string
  
  end
end
