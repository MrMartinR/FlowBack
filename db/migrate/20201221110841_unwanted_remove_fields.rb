class UnwantedRemoveFields < ActiveRecord::Migration[6.0]
  def change
    remove_column :originators, :length
    remove_column :originators, :default_rate
    remove_column :originators, :air
    remove_column :originators, :xirr
    remove_column :originators, :rating
  end
end
