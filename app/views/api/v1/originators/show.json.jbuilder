# #json.partial! "originators/originator", originator: @originator
json.success true

json.data [@originator] do |originator|
  #:name, :product_type_individuals, :product_type_companies, :length,
  # :default_rate, :air, :xirr, :rating, :apr, :logo, :icon, :website
  json.id originator.id
  json.product_type_individuals originator.product_type_individuals
  json.product_type_companies originator.product_type_companies
  json.length originator.length
  json.default_rate originator.default_rate
  json.air originator.air
  json.xirr originator.xirr
  json.rating originator.rating
  json.apr originator.apr
  json.logo originator.logo
  json.icon originator.icon
  json.website originator.website
end

