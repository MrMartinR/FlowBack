#json.array! @originators, partial: "originators/originator", as: :originator
#json.array! @user_accounts, partial: "user_accounts/user_account", as: :user_account
json.success true

#@originators = Originator.all
json.data @originators do |originator|
  #:name, :product_type_individuals, :product_type_companies, :length,
  # :default_rate, :air, :xirr, :rating, :apr, :logo, :icon, :website
  json.id originator.id
  json.customer_category originator.customer_category
  json.product_category_individuals originator.product_category_individuals
  json.product_category_companies originator.product_category_individuals
  json.length originator.length
  json.default_rate originator.default_rate
  json.air originator.air
  json.xirr originator.xirr
  json.rating originator.rating
  json.apr originator.apr
  json.logo originator.logo
  json.icon originator.icon

  if originator.contact.present?
    json.contact originator.contact, :country_id, :user_id,  :kind, :visibility, :category, :header, :name, :surname, :trade_name_nick, :founded, :description, :legal_form, :tags, :id_number, :image
  else
    json.contact nil
  end
end

#json.customer_category_value Originator::CUSTOMER_TYPE
#json.product_category_individuals_value Originator::INDIVIDUAL_CATEGORY
#json.product_category_companies_value Originator::BUSINESS_CATEGORY

if params[:page].present?
  json.page params[:page]
  json.total_pages @total_pages
end


