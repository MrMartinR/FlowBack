class AddIndexUserIdToUserLoans < ActiveRecord::Migration[6.0]
  def change
    add_index :user_loans, :user_id

  end
end
