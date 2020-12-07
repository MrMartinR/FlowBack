class CreateContactMethods < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_methods, id: :uuid do |t|
      t.uuid :contact_id
      t.uuid :created_by
      t.uuid :updated_by
      t.string :kind
      t.string :visibility
      t.string :data
      t.string :notes

      t.timestamps
    end
  end
end
