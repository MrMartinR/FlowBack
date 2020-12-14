class PlatformsJsonChangeString < ActiveRecord::Migration[6.0]
  def change
    remove_column :platforms, :category
    remove_column :platforms, :invest_mode
    remove_column :platforms, :protection_scheme
    remove_column :platforms, :account_category
    remove_column :platforms, :structure

    add_column :platforms, :category, :string
    add_column :platforms, :invest_mode, :string
    add_column :platforms, :protection_scheme, :string
    add_column :platforms, :account_category, :string
    add_column :platforms, :structure, :string
    
  
  

  end
end
