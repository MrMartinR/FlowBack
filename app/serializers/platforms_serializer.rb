class PlatformsSerializer
  include JSONAPI::Serializer

  attributes :contact_id, :category, :status, :liquidity,
             :term, :invest_mode, :min_investment,
             :secondary_market, :taxes, :cashflow_options,
             :protection_scheme, :cost, :profitable, :ifisa,
             :structure, :account_category, :welcome_bonus,
             :promo, :promo_end, :sm_notes
end
