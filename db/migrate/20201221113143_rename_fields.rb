class RenameFields < ActiveRecord::Migration[6.0]
  def change
    remove_column :originators, :product_category_individuals
    remove_column :originators, :product_category_companies

    add_column :originators, :product_category_consumer, :string
    add_column :originators, :product_category_business, :string
    
  end
end
