FactoryBot.define do
  factory :platform do
    status { "test" }
    liquidity { "test" }
    term { "test" }
    min_investment { "200" }
    secondary_market { "test" }
    promo { "test" }
    promo_end { "2021-05-02" }
    category { "test" }
  end
end