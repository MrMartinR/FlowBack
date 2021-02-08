class ContactSerializer
    include JSONAPI::Serializer
  #sets the type of serializer
  set_type :contact
  #The attributes needed in response
  attributes :trade_name, :company_name 
  #  Work in Progress, fill the rest of the atrributes

end