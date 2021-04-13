class PlatformSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :platform
  #The attributes needed in response
  attributes  :contact_id, :status,:liquidity, :term, :min_investment, :secondary_market, :cost, :structure, :welcome_bonus, :promo, :account_category, :protection_scheme

  attribute :taxes do |object|
    object.taxes if object.has_attribute?(:taxes)
  end
end