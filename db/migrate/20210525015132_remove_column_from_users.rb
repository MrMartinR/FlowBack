class RemoveColumnFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :surname
    remove_column :users, :dob
    remove_column :users, :name
    remove_column :users, :currency_id
    remove_column :users, :country_id
  end
end
