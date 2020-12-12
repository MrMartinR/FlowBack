#json.partial! "contact_methods/contact_method", contact_method: @contact_method
json.success true

json.data [@contact_method] do |contact_method|
  contact = contact_method.contact
  json.id contact_method.id
  json.user_id contact_method.user_id
  unless contact.blank?
    json.contact contact, :country_id, :user_id, :created_by, :updated_by, :kind, :visibility, :category, :header, :name, :surname, :trade_name_nick, :founded, :description, :legal_form, :tags, :id_number, :image
  else
    json.contact nil
  end
  json.kind contact_method.kind
  json.visibility contact_method.visibility
  json.data contact_method.data
  json.notes contact_method.notes
end
