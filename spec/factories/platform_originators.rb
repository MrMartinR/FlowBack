FactoryBot.define do
  factory :platform_originator do
    status { "test" }
    skin_game { "test" }
    grace_period { 4 }
    rating { "5 start" }
    notes { "test" }
  end
end