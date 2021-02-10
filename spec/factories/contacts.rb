FactoryBot.define do
  factory :contact do
    company_name { 'tesla' }
    kind { 'COMPANY' }

    factory :public_contact do
      visibility { 'PUBLIC' }
    end

    factory :private_contact do
      visibility { 'PRIVATE' }
    end

    user
    country
  end
end
