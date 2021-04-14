class OriginatorSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :originator
  #The attributes needed in response
  attributes  :customer_category, :product_category_consumer, :product_category_business, :apr, :contact
end