# #json.extract! contact, :id, :country_id, :user_id, :created_by, :updated_by, :kind, :visibility, :category, :header, :name, :surname, :trade_name_nick, :founded, :description, :legar_form, :tags, :id_number, :image, :created_at, :updated_at
# #json.url contact_url(contact, format: :json)
# #
# #json.array! @contacts, partial: "contacts/contact", as: :contact
# json.success true
#
# json.data [@contact] do |contact|
#   json.id contact.id
#   json.country_id contact.country_id
#   json.user_id contact.user_id
#   json.created_by contact.created_by
#   json.updated_by contact.updated_by
#   json.kind contact.kind
#   json.visibility contact.visibility
#   json.category contact.category
#   json.header contact.header
#   json.name contact.name
#   json.surname contact.surname
#   json.trade_name_nick contact.trade_name_nick
#   json.founded contact.founded
#   json.description contact.description
#   json.legal_form contact.legal_form
#   json.tags contact.tags
#   json.id_number contact.id_number
#   json.image contact.image
# end
# # json.extract! contact,
# # json.url contact_url(contact, format: :json)
#
#
