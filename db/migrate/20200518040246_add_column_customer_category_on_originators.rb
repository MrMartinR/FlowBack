class AddColumnCustomerCategoryOnOriginators < ActiveRecord::Migration[6.0]
  def change
    add_column :originators, :customer_category , :string
  end
end
