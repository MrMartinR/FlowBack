class AddColumnToCountries < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :fiscal_year_start, :date
    add_column :users, :dob, :date
  end
end
