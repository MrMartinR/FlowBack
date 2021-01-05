# json.array! @user_accounts, partial: "user_accounts/user_account", as: :user_account
json.success true

json.data @user_accounts do |user_account|
  json.id user_account.id
  json.country user_account.country
  json.account user_account.account
  json.currency user_account.currency
  json.user user_account.user
  json.category user_account.category
  json.name user_account.name
  json.active user_account.active
  json.loans user_account.user_loans
end
