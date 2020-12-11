class AddFieldsToContactsForhandlingimg < ActiveRecord::Migration[6.0]
  def change
    # changing column on contact table, TASK https://trello.com/c/aUs69SqE/88-contacts-be
    add_column :contacts, :has_icon, :boolean, default: false
    add_column :contacts, :has_logo, :boolean, default: false
    add_column :contacts, :has_picture, :boolean, default: false

    remove_column :contacts, :tags
    add_column :contacts, :tags, :json
    remove_column :contacts, :image
    rename_column :contacts, :header, :company_name
    rename_column :contacts, :trade_name_nick, :trade_name
    add_column :contacts, :nick, :string
    add_column :contacts, :dob, :string
    remove_column :contacts, :founded
    add_column :contacts, :founded, :date
  end
end
