class AddColumnOnUserPlatformHousekeeping < ActiveRecord::Migration[6.0]
  def change
    add_column :user_platforms, :created_by, :uuid
    add_column :user_platforms, :updated_by, :uuid
  end
end
