#json.array! @contacts, partial: "contacts/contact", as: :contact
json.success true

json.data @contacts do |contact|
  json.id contact.id
  if contact.country.present?
    json.country contact.country
  else
    json.country nil
  end

  if contact.user_id.present?
    json.user contact.user
  else
    json.user nil
  end
  json.has_icon contact.has_icon
  json.has_logo contact.has_logo
  json.has_picture contact.has_picture

  json.created_by contact.created_by
  json.updated_by contact.updated_by
  json.kind contact.kind
  json.visibility contact.visibility
  json.category contact.category
  json.company_name contact.company_name
  json.name contact.name
  json.surname contact.surname
  json.trade_name contact.trade_name
  json.founded contact.founded
  json.description contact.description
  json.legal_form contact.legal_form
  json.tags contact.tags
  json.id_number contact.id_number
  json.nick contact.nick
  json.dob contact.dob
end
# json.extract! contact,
# json.url contact_url(contact, format: :json)

