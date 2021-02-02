class CountrySerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :country
  #The attributes needed in response
  attributes :name, :iso_code, :continent
end