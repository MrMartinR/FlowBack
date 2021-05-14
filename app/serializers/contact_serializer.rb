class ContactSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :contact
  #The attributes needed in response
  attributes :name, :created_by, :updated_by, :kind, :company_name, :surname, :founded, :description, :tags, :legal_form, :id_number, :platform, :country, :dob, :nick, :account, :user, :originator, :trade_name, :contact_methods, :visibility
end