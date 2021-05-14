class PlatformSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :platform
  #The attributes needed in response
  attributes  :contact, :invest_mode, :taxes, :profitable, :ifisa, :sm_notes, :cashflow_options, :promo_end, :category, :status, :liquidity, :term, :min_investment, :secondary_market, :cost, :structure, :welcome_bonus, :promo, :account_category, :protection_scheme
end