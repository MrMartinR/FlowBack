class ChangeNotesInContactmethodFromStringToText < ActiveRecord::Migration[6.0]
  def change
    remove_column :contact_methods, :notes

    add_column :contact_methods, :notes, :text
    
  end
end
