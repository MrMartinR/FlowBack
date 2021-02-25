class ContactMethodSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :contact_method
  #The attributes needed in response
  attributes   :user_id, :contact, :kind, :visibility, :notes, :data
end