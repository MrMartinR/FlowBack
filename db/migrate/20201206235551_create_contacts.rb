class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts, id: :uuid do |t|
      t.uuid :country_id
      t.uuid :user_id
      t.uuid :created_by
      t.uuid :updated_by
      t.string :kind
      t.string :visibility
      t.json :category
      t.string :header
      t.string :name
      t.string :surname
      t.string :trade_name_nick
      t.integer :founded
      t.text :description
      t.string :legal_form
      t.string :tags
      t.string :id_number
      t.string :image

      t.timestamps
    end
  end
end
