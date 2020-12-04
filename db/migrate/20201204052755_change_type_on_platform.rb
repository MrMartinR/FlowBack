class ChangeTypeOnPlatform < ActiveRecord::Migration[6.0]
  def change
    ## change column from string into json ( remove the column , and then add new column with different type )
    # remove
    remove_column :platforms, :category
    remove_column :platforms, :invest_mode
    remove_column :platforms, :protection_scheme
    remove_column :platforms, :account_category
    remove_column :platforms, :structure

    add_column :platforms, :category, :json
    add_column :platforms, :invest_mode, :json
    add_column :platforms, :protection_scheme, :json
    add_column :platforms, :account_category, :json
    add_column :platforms, :structure, :json
  end
end
