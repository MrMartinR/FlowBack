# json.array! @platforms, partialjson. "api/v1/platforms/platform", asjson. json.platform
#

json.success true

json.data @platforms do |platform|
  json.id platform.id
  json.contact_id platform.contact_id
  json.category parser_json(platform.category)
  json.status platform.status
  json.liquidity platform.liquidity
  json.term platform.term
  json.invest_mode parser_json(platform.invest_mode)
  json.min_investment platform.min_investment
  json.secondary_market platform.secondary_market
  json.taxes platform.taxes
  json.cashflow_options platform.cashflow_options
  json.protection_scheme parser_json(platform.protection_scheme)
  json.cost platform.cost
  json.profitable platform.profitable
  json.ifisa platform.ifisa
  json.structure platform.structure
  json.account_category parser_json(platform.account_category)
  json.welcome_bonus platform.welcome_bonus
  json.promo platform.promo
  json.promo_end platform.promo_end
  json.sm_notes platform.sm_notes
  if platform.contact.present?
    json.contact platform.contact
  else
    json.contact 'Not Found'
  end
end

