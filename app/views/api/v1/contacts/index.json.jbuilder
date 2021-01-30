# json.array! @contacts, partial: "contacts/contact", as: :contact
json.success true

json.data @contacts do |contact|
  json.id contact.id
  #if contact.country.present?
  #  json.country contact.country
  #else
  #  json.country 'Not found'
  #end
  #if contact.platform.present?
  #  json.platform contact.platform
  #else
  #  json.platform 'Not found'
  #end
  #if contact.originator.present?
  #  json.originator contact.originator
  #else
  #  json.originator 'Not found'
  #end
  #if contact.account.present?
  #  json.account contact.account
  #else
  #  json.account 'Not found'
  #end

  if contact.user_id.present?
    json.user contact.user
  else
    json.user 'Not found'
  end

  json.created_by contact.created_by
  json.updated_by contact.updated_by
  json.kind contact.kind
  json.visibility contact.visibility
  json.company_name contact.company_name
  json.name contact.kind == "INDIVIDUAL" ? contact.name : nil
  json.surname contact.surname
  json.trade_name contact.kind == "COMPANY" ? contact.trade_name : nil
  json.founded contact.founded
  json.description contact.description
  json.legal_form contact.legal_form
  json.tags contact.tags
  json.id_number contact.id_number
  json.nick contact.kind == "INDIVIDUAL" ? contact.nick : nil
  json.dob contact.dob
end
# json.extract! contact,
# json.url contact_url(contact, format: :json)
