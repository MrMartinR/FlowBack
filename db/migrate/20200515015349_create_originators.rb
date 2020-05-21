class CreateOriginators < ActiveRecord::Migration[6.0]
  def change
    create_table :originators, id: :uuid do |t|
      t.string :name
      t.string :product_type_individuals
      t.string :product_type_companies
      t.string :length
      t.float :default_rate
      t.float :air
      t.float :xirr
      t.string :rating
      t.float :apr
      t.string :logo
      t.string :icon
      t.string :website

      t.timestamps
    end
  end
end
