FactoryBot.define do
  factory :country do
    name { 'Egypt' }
    iso_code { 'EG' }
    continent { 'Africa' }

    currency
  end
end
