FactoryBot.define do
  #  @rev data is wrong
  factory :currency do
    name { 'India' }
    code { 'IND' }
    symbol { 'test' }
    decimal_places { 2 }
    kind { "test" }
  end
end