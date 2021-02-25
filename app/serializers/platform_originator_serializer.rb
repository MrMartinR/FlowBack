class PlatformOriginatorSerializer
  include JSONAPI::Serializer
#sets the type of serializer
  set_type :platform_originator
#The attributes needed in response
  attributes :originator, :platform, :status, :skin_game, :grace_period, :apr, :rating, :length, :structure, :notes, :buyback, :buyback_principal, :buyback_interest, :buyback_activation

  attribute :currency do |object|
    object.currency if object.has_attribute?(:currency)
  end
end