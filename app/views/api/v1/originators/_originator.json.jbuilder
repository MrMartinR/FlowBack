json.extract! originator, :id, :customer_category, :product_category_consumer, :product_category_business, :apr,
              :created_at, :updated_at
json.url originator_url(originator, format: :json)
