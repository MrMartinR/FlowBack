class LoanSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :loan
  #The attributes needed in response
  attributes  :code, :internal_code, :name, :borrower, :gender, :air,
              :status, :xirr, :protection_scheme, :rating, :dti_rating, :borrower_type,
              :category, :amount, :description, :link, :security_details, :amortization,
              :date_maturity, :date_listed, :date_issued, :installment, :notes, :country,
              :currency, :country_id, :currency_id, :created_at, :updated_at, :created_by, :updated_by

  #for serializing platform
  attribute :platform do |loan|
    loan.platform_originator.platform
  end

  #for serializing originator
  attribute :originator do |loan|
    loan.platform_originator.originator
  end

  #for serializing iso_code
  attribute :country_iso_code do |object|
    object.country.iso_code
  end

  #for serializing country name
  attribute :country_name do |object|
    object.country.name
  end

  #for serializing platform contact id
  attribute :platform_contact_id do |object|
    object.platform_originator.platform.contact_id
  end

  #for serializing originator contact id
  attribute :originator_contact_id do |object|
    object.platform_originator.originator.contact_id
  end

  #for serializing platform trade name
  attribute :platform_trade_name do |object|
    object.platform_originator.platform.contact.trade_name
  end

  #for serializing originator trade name
  # @rev why this if? all the originators has a contact and all are companies and all have trade_name
  attribute :originator_trade_name do |object|
    object.platform_originator.originator.contact.trade_name if object.platform_originator.originator.contact
  end

  #for serializing currency code
  attribute :currency_code do |object|
    object.currency.code
  end

  #for serializing user loan id
  attribute :user_loan_id do |object|
    object.user_loan_ids
  end
end