class ChangeColumnTypeInOriginators < ActiveRecord::Migration[6.1]
  def up
    change_column :originators, :product_category_business, :jsonb, using: 'product_category_business::jsonb'
    change_column :originators, :product_category_consumer, :jsonb, using: 'product_category_consumer::jsonb'
  end

  def down
    change_column :originators, :product_category_consumer, :string
    change_column :originators, :product_category_business, :string
  end
end
