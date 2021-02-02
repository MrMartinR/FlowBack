class CurrencySerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :currency
  #The attributes needed in response
  attributes :name, :symbol, :code, :kind, :fx_eur, :decimal_places
end