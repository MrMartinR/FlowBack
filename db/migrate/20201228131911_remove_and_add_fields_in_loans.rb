class RemoveAndAddFieldsInLoans < ActiveRecord::Migration[6.0]
  def change
    remove_column :loans, :originator_id
    remove_column :loans, :secured_personal
    remove_column :loans, :secured_buyback
    remove_column :loans, :secured_collaretal
    remove_column :loans, :platform_id
    remove_column :loans, :security

    add_column :loans, :platform_originator_id, :uuid
    add_column :loans, :security_details, :text
    add_column :loans, :protection_scheme, :jsonb
  end
end
