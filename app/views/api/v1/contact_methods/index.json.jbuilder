json.success true

json.data @contact_methods do |contact_method|
  contact = contact_method.contact
  json.id contact_method.id
  json.user_id contact_method.user_id
  if contact.present?
    json.contact contact_method.contact
  else
    json.contact "Not found"
  end
  json.kind contact_method.kind
  json.visibility contact_method.visibility
  json.data contact_method.data
  json.notes contact_method.notes
end
