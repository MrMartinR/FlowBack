class ContactsSerializer
  include JSONAPI::Serializer

  attributes :kind, :country_id, :name, :surname, :founded,
             :created_by, :updated_by, :visibility, :tags, :id,
             :id_number, :company_name, :name, :trade_name, :description
end
