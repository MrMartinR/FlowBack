class AddColumnOriginators < ActiveRecord::Migration[6.0]
  def change
    add_column :originators, :contact_id, :uuid
    remove_column :originators, :name
    remove_column :originators, :website
    rename_column :originators, :product_type_individuals, :product_category_individuals
    rename_column :originators, :product_type_companies, :product_category_companies

    ## because logo + image are removed manually from pgadmin, here the code to adjust for migration scheme
    remove_column :originators, :logo
    remove_column :originators, :icon
  end
end
