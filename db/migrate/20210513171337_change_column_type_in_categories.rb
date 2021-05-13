class ChangeColumnTypeInCategories < ActiveRecord::Migration[6.1]
  def up
    change_column :platforms, :category, :jsonb, using: 'category::jsonb'
    change_column :platforms, :invest_mode, :jsonb, using: 'invest_mode::jsonb'
    change_column :platforms, :protection_scheme, :jsonb, using: 'protection_scheme::jsonb'
    change_column :platforms, :account_category, :jsonb, using: 'account_category::jsonb'
    change_column :platforms, :structure, :jsonb, using: 'structure::jsonb'
  end

  def down
    change_column :platforms, :category, :string
    change_column :platforms, :invest_mode, :string
    change_column :platforms, :protection_scheme, :string
    change_column :platforms, :account_category, :string
    change_column :platforms, :structure, :string
  end
end
