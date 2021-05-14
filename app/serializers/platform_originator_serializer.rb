class PlatformOriginatorSerializer
  include JSONAPI::Serializer
#sets the type of serializer
  set_type :platform_originator
#The attributes needed in response
  attributes :originator, :platform, :status, :skin_game, :grace_period, :apr, :rating, :length, :structure, :notes, :buyback, :buyback_principal, :buyback_interest, :buyback_activation

  attribute :currency do |object|
    object.currency if object.has_attribute?(:currency)
  end

 # for originator trade name
  attribute :originator_trade_name do |object|
    object.originator.contact.trade_name
  end

 # for platform trade name
  attribute :platform_trade_name do |object|
    object.platform.contact.trade_name
  end

 # for originator country id
  attribute :country_id do |object|
    object.originator.contact.country_id
  end

 # for country iso code
  attribute :country_iso_code do |object|
    object.originator.contact.country.iso_code
  end
end