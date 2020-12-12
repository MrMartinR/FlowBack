json.success true

json.data @contact_methods do |contact_method|
  contact = contact_method.contact
  json.id contact_method.id
  json.user_id contact_method.user_id
  #json.contact c, c.attributes.keys.map { |key| key.to_sym } - [:created_at, :updated_at, :created_by, :updated_by]
  json.contact contact, :country_id, :user_id, :created_by, :updated_by, :kind, :visibility, :category, :header, :name, :surname, :trade_name_nick, :founded, :description, :legal_form, :tags, :id_number, :image
  json.kind contact_method.kind
  json.visibility contact_method.visibility
  json.data contact_method.data
  json.notes contact_method.notes
end

if params[:page]
  json.page params[:page].to_i
  json.total_pages @total_pages
end