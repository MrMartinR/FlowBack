class ChangeColumnOnContactAndremovesomecolumnonusers < ActiveRecord::Migration[6.0]
  def change
    remove_column :contacts, :dob
    add_column :contacts, :dob, :date
    add_column :users,:contact_id, :uuid
    remove_column :users, :image
  end
end
