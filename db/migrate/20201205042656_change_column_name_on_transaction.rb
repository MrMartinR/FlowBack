class ChangeColumnNameOnTransaction < ActiveRecord::Migration[6.0]
  def change
    rename_column :transactions, :type, :kind
    add_column :transactions,:transaction_related_id, :uuid
  end
end
