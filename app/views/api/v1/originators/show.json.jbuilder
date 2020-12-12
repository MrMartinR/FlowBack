# #json.partial! "originators/originator", originator: @originator
json.success true

json.success true

#@originators = Originator.all
json.data [@originator] do |originator|
  #:name, :product_type_individuals, :product_type_companies, :length,
  # :default_rate, :air, :xirr, :rating, :apr, :logo, :icon, :website
  json.id originator.id
  json.customer_category originator.customer_category
  json.product_category_individuals originator.product_category_individuals
  json.product_category_companies originator.product_category_companies
  json.length originator.length
  json.default_rate originator.default_rate
  json.air originator.air
  json.xirr originator.xirr
  json.rating originator.rating
  json.apr originator.apr

  if originator.contact.present?
    json.contact originator.contact
  else
    json.contact nil
  end
end

