class AddUserIdToUserLoans < ActiveRecord::Migration[6.0]
  def change
    add_column :user_loans, :user_id, :uuid
  end
end
