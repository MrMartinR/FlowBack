#json.array! @platform_originators, partial: "platform_originators/platform_originator", as: :platform_originator

json.success true

json.data @platform_originators do |po|
  #:id, :originator_id, :platform_id, :status, :skin_game, :grace_period, :rating, :length, :apr, :structure,
  # :notes, :buyback, :buyback_principal, :buyback_interest, :buyback_activation, :created_at, :updated_at
  jsond.id po.id
  jsond.originator_id po.originator_id
  jsond.platform_id platform_id.id
  jsond.status po.status
  jsond.skin_game po.skin_game
  jsond.grace_period po.grace_period
  jsond.rating po.rating
  jsond.length po.length
  jsond.apr po.apr
  jsond.structure po.structure
  jsond.notes po.notes
  jsond.buyback po.buyback
  jsond.buyback_principal po.buyback_principal
  jsond.buyback_interest po.buyback_interest
  jsond.buyback_activation po.buyback_activation
end

if params[:page]
  json.page params[:page]
  json.total_pages @total_pages
end
