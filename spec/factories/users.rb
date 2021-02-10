FactoryBot.define do
  factory :user do
    sequence :username do |n|
      "name #{n}"
    end

    sequence :email do |n|
      "email#{n}@example.com"
    end

    password { 'password' }
    password_confirmation { 'password' }

    factory :admin do
      after(:create) { |user| user.add_role(:admin) }
    end

    factory :contributor do
      after(:create) { |user| user.add_role(:contributor) }
    end
  end
end
