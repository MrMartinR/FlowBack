class CreateUserPlatforms < ActiveRecord::Migration[6.0]
  def change
    create_table :user_platforms, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :platform_id
      t.text :overview
      t.text :strategy
      t.string :user
      t.string :pass
      t.string :internal_id
      t.text :notes
      t.integer :rating
      t.float :xirr
      t.float :total_loss
      t.float :air

      t.timestamps
    end

    add_index :user_platforms, :user_id
    add_index :user_platforms, :platform_id
  end
end
