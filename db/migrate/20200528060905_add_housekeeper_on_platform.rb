class AddHousekeeperOnPlatform < ActiveRecord::Migration[6.0]
  def change
    add_column :platforms, :created_by , :uuid
    add_column :platforms, :updated_by , :uuid
  end
end
