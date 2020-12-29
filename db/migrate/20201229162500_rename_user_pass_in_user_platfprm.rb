class RenameUserPassInUserPlatfprm < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_platforms, :user
    remove_column :user_platforms, :pass

    add_column :user_platforms, :login_user, :string
    add_column :user_platforms, :login_pass, :string

  end
end
