# json.array! @originators, partial: "originators/originator", as: :originator
# json.array! @user_accounts, partial: "user_accounts/user_account", as: :user_account
json.success true

# @originators = Originator.all
json.data @originators do |originator|
  json.id originator.id
  json.trade_name originator.trade_name
  json.customer_category originator.customer_category
  json.product_category_consumer originator.product_category_consumer
  json.product_category_business originator.product_category_business
  json.apr originator.apr

  # if originator.contact.present?
  #   json.contact originator.contact
  # else
  #   json.contact 'Not Found'
  # end
end
