FactoryBot.define do
  factory :contact do
    company_name { 'tesla' }
    visibility { 'public' }
    kind { 'company' }

    user
    country
  end
end
