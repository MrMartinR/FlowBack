# json.array! @platforms, partialjson. "api/v1/platforms/platform", asjson. json.platform
#

json.success true

json.data @platforms do |platform|
  json.id platform.id
  json.contact_id platform.contact_id
  json.trade_name platform.trade_name
  json.category parser_json(platform.category)
  json.status platform.status
  json.liquidity platform.liquidity
  json.term platform.term
  json.invest_mode parser_json(platform.invest_mode)
  json.min_investment platform.min_investment
  json.secondary_market platform.secondary_market
  json.protection_scheme parser_json(platform.protection_scheme)
  json.cost platform.cost
  json.structure platform.structure
  json.account_category parser_json(platform.account_category)
  json.welcome_bonus platform.welcome_bonus
  json.promo platform.promo
end
