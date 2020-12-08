class AddUserIdOncontactmethods < ActiveRecord::Migration[6.0]
  def change
    add_column :contact_methods, :user_id, :uuid
  end
end
