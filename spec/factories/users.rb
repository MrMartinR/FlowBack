FactoryBot.define do
  factory :user do
    username { 'Admin' }
    email { 'admin@flowfin.tech' }
    password { 'admin1234' }
    password_confirmation { 'admin1234' }
  end
end