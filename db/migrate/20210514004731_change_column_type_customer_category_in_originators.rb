class ChangeColumnTypeCustomerCategoryInOriginators < ActiveRecord::Migration[6.1]
  def up
    change_column :originators, :customer_category, :jsonb, using: 'customer_category::jsonb'
  end

  def down
    change_column :originators, :customer_category, :string
  end
end
