class CreatePlatforms < ActiveRecord::Migration[6.0]
  def change
    create_table :platforms, id: :uuid do |t|
      t.uuid :contact_id
      t.string :category
      t.string :status
      t.string :liquidity
      t.string :term
      t.text :invest_mode
      t.string :min_investment
      t.string :secondary_market
      t.string :taxes
      t.string :cashflow_options
      t.string :protection_scheme
      t.string :cost
      t.boolean :profitable
      t.boolean :ifisa
      t.string :structure
      t.string :account_category
      t.string :welcome_bonus
      t.string :promo
      t.date :promo_end
      t.string :icon
      t.string :logo

      t.timestamps
    end

    add_index :platforms, :contact_id
  end
end
