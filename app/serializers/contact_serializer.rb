class ContactSerializer
  include JSONAPI::Serializer

  # sets the type
  set_type :contact

  # sets the id
  set_id :id

  # sets the self link
  # @REV: I am not sure the endpoint.. if needs the /v1/ etc..  check this..
  link :self do |object|
    "https://api.flowfin.tech/contacts/#{object.id}"
  end

  # attributes in the response
  # attributes :name, :created_by, :updated_by, :kind, :company_name, :surname, :founded, :description, :tags, :legal_form, :id_number, :platform, :country, :dob, :nick, :account, :user, :originator, :trade_name, :contact_methods, :visibility
  # attributes :platform, :country, :account, :user, :originator, :contact_methods,
  # @TODO: mover los 3 atributos fuera de la seccion de atributos del contacto
  # meterlos dentro de los atributoss en los included o relationships (no estoy seguro donde deben ir)
  # (por defecto las relationships solo envian el id y el tipo )

  attribute :contact_methods
  attribute :user
  attribute :country
  attributes :kind, :name_header, :trade_name, :company_name, :nick, :name, :surname, :founded, :description, :tags, :legal_form, :id_number, :dob,  :visibility

          
# -------------------------
  # relationships
# -------------------------
has_one :country
has_one :user, optional: true
has_one :platform, optional: true
has_one :originator, optional: true
has_one :account, optional: true
has_many :contact_methods, optional: true


# -------------------------
# serializing the name_header
# -------------------------
 attribute :name_header do |contact|
   if contact.trade_name.present?
    "#{contact.trade_name}"
  elsif contact.nick.present?
    "#{contact.nick}"
    elsif contact.name.present? && contact.surname.present?
    "#{contact.name} " " #{contact.surname}"
    else
      "#{contact.name}"
    end
 end
        
end