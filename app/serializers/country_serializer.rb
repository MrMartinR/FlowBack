class CountrySerializer
  include JSONAPI::Serializer
  set_type :country
  attributes :name, :iso_code, :continent
end