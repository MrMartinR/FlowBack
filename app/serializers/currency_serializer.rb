class CurrencySerializer
  include JSONAPI::Serializer
  set_type :currency
  attributes :name, :symbol, :code, :kind, :fx_eur, :decimal_places
end