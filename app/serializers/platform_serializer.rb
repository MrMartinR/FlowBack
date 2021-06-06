class PlatformSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :platform

  set_id :id

  link :self do |object|
    "https://app.flowfin.tech/platforms/#{object.id}"
  end

  #The attributes needed in response
  # attribute :contact
  attributes :invest_mode, :taxes, :profitable, :ifisa, :sm_notes, :cashflow_options, :promo_end, :category, :status, :liquidity, :term, :min_investment, :secondary_market, :cost, :structure, :welcome_bonus, :promo, :account_category, :protection_scheme

  # relationships
  belongs_to :contact ,  links: {
    self: -> (object) {
      "https://app.flowfin.tech/contacts/#{object.contact.id}"
    }
  }
end