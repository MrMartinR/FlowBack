FactoryBot.define do
  factory :user do
    username { 'MyString' }
    email { 'email@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
