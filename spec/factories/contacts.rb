FactoryBot.define do
  # FIXME no idea about this, but visibility has to be Public or Private
  # FIXME if kind is company, name and surname are always null. instead use trade_name and company_name
  factory :contact do
    name { 'test' }
    surname { "nick" }
    kind { "company" }
    visibility { "public" }
  end
end