FactoryBot.define do
  factory :platform do
    min_investment { '3000' }
    profitable { true }

    association :contact, factory: :public_contact
  end
end
