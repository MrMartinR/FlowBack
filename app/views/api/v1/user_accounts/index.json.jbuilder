#json.array! @user_accounts, partial: "user_accounts/user_account", as: :user_account
json.success true

json.data @user_accounts do |user_account|
  #  :id, :country_id, :account_id, :platform_id, :currency_id, :user_id, :category, :name, :total_fee, :total_loss,
  #  :total_tax, :active, :total_invest, :total_profit, :total_referral, :total_interest, :total_bonus
  json.id user_account.id
  json.country_id user_account.country_id
  json.account_id user_account.account_id
  json.platform_id user_account.platform_id
  json.currency_id user_account.currency_id
  json.user_id user_account.user_id
  json.category user_account.category
  json.name user_account.name
  json.total_fee user_account.total_fee
  json.total_loss user_account.total_loss
  json.total_tax user_account.total_tax
  json.active user_account.active
  json.total_invest user_account.total_invest
  json.total_profit user_account.total_profit
  json.total_referral user_account.total_referral
  json.total_interest user_account.total_interest
  json.total_bonus user_account.total_bonus
end
