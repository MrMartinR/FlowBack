class AddHousekeepOriginators < ActiveRecord::Migration[6.0]
  def change
    add_column :originators,:created_by, :uuid
    add_column :originators,:updated_by, :uuid
  end
end
