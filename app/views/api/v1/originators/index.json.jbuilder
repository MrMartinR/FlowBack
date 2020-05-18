#json.array! @originators, partial: "originators/originator", as: :originator
#json.array! @user_accounts, partial: "user_accounts/user_account", as: :user_account
json.success true

#@originators = Originator.all
json.data @originators do |originator|
  #:name, :product_type_individuals, :product_type_companies, :length,
  # :default_rate, :air, :xirr, :rating, :apr, :logo, :icon, :website
  json.id originator.id
  json.customer_category originator.customer_category
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

json.customer_category_value Originator::CUSTOMER_TYPE
json.product_type_individuals_value Originator::INDIVIDUAL_CATEGORY
json.product_type_companies_value Originator::BUSINESS_CATEGORY

if params[:page].present?
  json.page params[:page]
  json.total_pages @total_pages
end


