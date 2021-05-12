class LoanSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :loan
  #The attributes needed in response
  attributes  :code, :internal_code, :name, :borrower, :gender, :air, :status, :xirr, :protection_scheme, :rating, :dti_rating, :borrower_type, :category, :amount, :description, :link, :security_details, :amortization, :date_maturity, :date_listed, :date_issued, :installment, :notes, :country, :currency

  #for serializing platform
  attribute :platform do |loan|
    loan.platform_originator.platform
  end

  #for serializing originator
  attribute :originator do |loan|
    loan.platform_originator.originator
  end

  #for serializing iso_code
  attribute :iso_code do |object|
    object.country.iso_code
  end

  #for serializing country name
  attribute :country_name do |object|
    object.country.name
  end

  #for serializing contact id
  attribute :contact_id do |object|
    object.platform_originator.platform.contact_id
  end

  #for serializing trade name
  attribute :trade_name do |object|
    object.platform_originator.platform.contact.trade_name
  end

  #for serializing currency code
  attribute :currency_code do |object|
    object.currency.code
  end
end