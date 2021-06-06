FactoryBot.define do
  factory :loan do
    name { 'Carloan' }
    gender { 'male' }
    amount { 200 }
    description { "testdescription" }
    notes { "testnotes" }
    code { "test" }
  end
end