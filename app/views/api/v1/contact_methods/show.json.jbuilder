#json.partial! "contact_methods/contact_method", contact_method: @contact_method
json.success true

json.data [@contact_method] do |contact_method|
  json.id contact_method.id
  json.user_id contact_method.user_id
  json.contact_id contact_method.contact_id
  json.kind contact_method.kind
  json.visibility contact_method.visibility
  json.data contact_method.data
  json.notes contact_method.notes
end
