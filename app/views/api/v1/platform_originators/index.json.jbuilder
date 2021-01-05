# json.array! @platform_originators, partial: "platform_originators/platform_originator", as: :platform_originator

json.success true

json.data @platform_originators do |po|
  #:id, :originator_id, :platform_id, :status, :skin_game, :grace_period, :rating, :length, :apr, :structure,
  # :notes, :buyback, :buyback_principal, :buyback_interest, :buyback_activation, :created_at, :updated_at
  json.id po.id
  json.originator po.originator
  json.platform po.platform
  json.status po.status
  json.skin_game po.skin_game
  json.grace_period po.grace_period
  json.rating po.rating
  json.length po.length
  json.apr po.apr
  json.structure po.structure
  json.currecies po.currency
  json.notes po.notes
  json.buyback po.buyback
  json.buyback_principal po.buyback_principal
  json.buyback_interest po.buyback_interest
  json.buyback_activation po.buyback_activation
end
