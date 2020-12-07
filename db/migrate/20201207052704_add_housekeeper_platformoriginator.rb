class AddHousekeeperPlatformoriginator < ActiveRecord::Migration[6.0]
  def change
    # platformoriginators table
    add_column :platform_originators, :created_by, :uuid
    add_column :platform_originators, :updated_by, :uuid
  end
end