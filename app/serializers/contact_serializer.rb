class ContactSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :contact
  #The attributes needed in response
  attributes :name

  # attribute
  attribute :created_by do |object|
    object.created_by if object.has_attribute?(:created_by)
  end

  attribute :created_by do |object|
    object.created_by if object.has_attribute?(:created_by)
  end

  attribute :updated_by do |object|
    object.updated_by if object.has_attribute?(:updated_by)
  end

  attribute :kind do |object|
    object.kind if object.has_attribute?(:kind)
  end

  attribute :visibility do |object|
    object.visibility if object.has_attribute?(:visibility)
  end

  attribute :company_name do |object|
    object.company_name if object.has_attribute?(:company_name)
  end

  attribute :surname do |object|
    object.surname if object.has_attribute?(:surname)
  end

  attribute :founded do |object|
    object.founded if object.has_attribute?(:founded)
  end

  attribute :description do |object|
    object.description if object.has_attribute?(:description)
  end

  attribute :tags do |object|
    object.tags if object.has_attribute?(:tags)
  end

  attribute :legal_form do |object|
    object.legal_form if object.has_attribute?(:legal_form)
  end

  attribute :id_number do |object|
    object.id_number if object.has_attribute?(:id_number)
  end

  attribute :dob do |object|
    object.dob if object.has_attribute?(:dob)
  end

  attribute :nick do |object|
    object.nick if object.has_attribute?(:nick)
  end

  attribute :user do |object|
    object.user if object.has_attribute?(:user)
  end

  attribute :account do |object|
    object.account if object.has_attribute?(:account)
  end

  attribute :platform do |object|
    object.platform if object.has_attribute?(:platform)
  end

  attribute :originator do |object|
    object.originator if object.has_attribute?(:originator)
  end

  attribute :country do |object|
    object.country if object.has_attribute?(:country)
  end
end