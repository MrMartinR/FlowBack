class RemoveFieldsFromUserPlatform < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_platforms, :xirr
    remove_column :user_platforms, :total_loss
    remove_column :user_platforms, :air
    
  end
end
