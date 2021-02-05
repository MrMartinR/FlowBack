FactoryBot.define do
  factory :user_loan do
    slice_name { 'test' }
    market { "primary" }
    xirr { 86 }
    investment_amount { 20.00 }
    invest_mode { "manual" }
    position { "in" }
    date_in { "2020-02-01" }
    date_out { "2020-03-01" }
  end
end