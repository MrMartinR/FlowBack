class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans, id: :uuid do |t|
      t.uuid :country_id
      t.uuid :currency_id
      t.uuid :originator_id
      t.uuid :platform_id
      t.string :code
      t.string :internal_code
      t.string :name
      t.string :borrower
      t.string :gender
      t.float :air
      t.string :status
      t.float :xirr
      t.string :rating
      t.float :dti_rating
      t.string :borrower_type
      t.string :category
      t.float :amount
      t.text :description
      t.string :link
      t.boolean :secured_buyback
      t.boolean :secured_personal
      t.boolean :secured_collaretal
      t.text :security
      t.date :date_listed
      t.date :date_issued
      t.date :date_maturity
      t.string :amortization
      t.string :installment
      t.text :notes

      t.timestamps
    end
    add_index :loans, :country_id
    add_index :loans, :currency_id
    add_index :loans, :originator_id
    add_index :loans, :platform_id
  end
end
