FactoryBot.define do
  factory :originator do
    apr { 200.00 }
    customer_category { "Consumer" }
    product_category_business { "Bridge" }
    product_category_consumer { "Bridge" }
  end
end