FactoryBot.define do
  factory :contact do
    name { 'test' }
    surname { "nick" }
    kind { "company" }
    visibility { "public" }
  end
end