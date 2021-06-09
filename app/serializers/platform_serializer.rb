class PlatformSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :platform

  set_id :id

# @REV: estp tampoco se de donde me lo he sacado.. para generar el link
  link :self do |object|
    "https://api.flowfin.tech/v1/platforms/#{object.id}"
  end


  # -------------------------
  # attributes in the response
  # -------------------------
  # @REV: He comentado el atributo :contact para evitar el drama N+1
  # attribute :contact
  attributes :invest_mode, :taxes, :profitable, :ifisa, :sm_notes, :cashflow_options,
              :promo_end, :category, :status, :liquidity, :term, :min_investment, 
              :secondary_market, :cost, :structure, :welcome_bonus, :promo, :account_category, 
              :protection_scheme

# -------------------------
  # relationships
# -------------------------
  #  el [  belongs_to :contact ] agrega la siguiente estructura a la respuesta: 
  # "relationships": {
  #               "contact": {
  #                 "data": {
  #                     "id": "59ce12ce-4a69-45a4-b229-69b8f3c9d5ea",
  #                     "type": "contact"
  #                 }
  #             }
  #         },
  belongs_to :contact 

  # este codigo para pillar el link del contacto me lo saque de sabedios 
  # donde y tambien hace el drama del N+1
  # belongs_to :contact ,  links: {
  #   self: -> (object) {
  #     "https://app.flowfin.tech/contacts/#{object.contact.id}"
  #   }
  # }
end