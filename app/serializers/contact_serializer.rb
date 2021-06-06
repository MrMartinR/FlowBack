class ContactSerializer
  include JSONAPI::Serializer

  # sets the type
  set_type :contact

  # sets the id
  set_id :id

  # sets the self link
  link :self do |object|
    "https://api.flowfin.tech/contacts/#{object.id}"
  end

  #The attributes needed in response
  # attributes :name, :created_by, :updated_by, :kind, :company_name, :surname, :founded, :description, :tags, :legal_form, :id_number, :platform, :country, :dob, :nick, :account, :user, :originator, :trade_name, :contact_methods, :visibility
  attributes :platform, :country, :account, :user, :originator, :contact_methods,
             :kind, :name_header, :trade_name, :company_name, :nick, :name, :surname, :founded, :description, :tags, :legal_form, :id_number, :dob,  :visibility

             
# serializing the name_header
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