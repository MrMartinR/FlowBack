# #json.partial! "originators/originator", originator: @originator
json.success true

json.success true

json.data [@originator] do |originator|
  json.id originator.id
  json.customer_category originator.customer_category
  json.product_category_consumer originator.product_category_consumer
  json.product_category_business originator.product_category_business

  json.apr originator.apr

  if originator.contact.present?
    json.contact originator.contact
  else
    json.contact nil
  end
end
