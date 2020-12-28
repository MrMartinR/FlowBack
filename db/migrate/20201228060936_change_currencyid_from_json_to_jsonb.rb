class ChangeCurrencyidFromJsonToJsonb < ActiveRecord::Migration[6.0]
  def change
    remove_column :platform_originators, :currency_id

    add_column :platform_originators, :currency_id, :jsonb, default: {} 
  end
end
