class AddColumnCurIdOnplatformoriginator < ActiveRecord::Migration[6.0]
  def change
    add_column :platform_originators, :currency_id, :json
  end
end
