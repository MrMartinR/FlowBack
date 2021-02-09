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
  end
end
