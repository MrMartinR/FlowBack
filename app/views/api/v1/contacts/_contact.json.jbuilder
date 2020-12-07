json.extract! contact, :id, :country_id, :user_id, :created_by, :updated_by, :kind, :visibility, :category, :header, :name, :surname, :trade_name_nick, :founded, :description, :legar_form, :tags, :id_number, :image, :created_at, :updated_at
json.url contact_url(contact, format: :json)
