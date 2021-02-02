FactoryBot.define do
  factory :user do
    username { 'MyString' }
    email { 'email@example.com' }
    allow_password_change { true }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
