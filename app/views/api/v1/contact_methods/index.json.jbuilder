json.success true

json.data @contact_methods do |contact_method|
  json.id contact_method.id
  json.kind contact_method.kind
  json.visibility contact_method.visibility
  json.data contact_method.data
  json.notes contact_method.notes
end