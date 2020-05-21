class CreatePlatformOriginators < ActiveRecord::Migration[6.0]
  def change
    create_table :platform_originators, id: :uuid do |t|
      t.uuid :originator_id
      t.uuid :platform_id
      t.string :status
      t.float :skin_game
      t.integer :grace_period
      t.string :rating
      t.string :length
      t.float :apr
      t.string :structure
      t.text :notes
      t.string :buyback
      t.boolean :buyback_principal
      t.boolean :buyback_interest
      t.integer :buyback_activation

      t.timestamps
    end

    add_index :platform_originators, :originator_id
    add_index :platform_originators, :platform_id
  end
end
