class CreateIcons < ActiveRecord::Migration[6.0]
  def change
    create_table :icons, id: :uuid do |t|
      t.uuid :uid
      t.string :category
      t.text :logo
      t.text :icn

      t.timestamps
    end
  end
end
