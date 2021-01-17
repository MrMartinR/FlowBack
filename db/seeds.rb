
require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or find_or_create_byd alongside the database with db:setup).
# The preceeding blocks creates some users, Admins, Countries, Currencies, Originators, Platform originators, user accounts, User roles and transactions.
​

# # seeding for countries
# CSV.foreach(Rails.root.join("lib/seeds/countries.csv"), headers: false) do |row|
#   Country.create({
#     currency_id: row[0]
#     name: row[1]
#     iso_code: row[2]
#     continent: row[3]
#     flag: row[4]
#   })
# end
#
# # seeding for currencies
# CSV.foreach(Rails.root.join("lib/seeds/currencies.csv"), headers: false) do |row|
#   Currency.create({
#     id: row[0],
#     name: row[1],
#     code: row[2],
#     symbol: row[3],
#     decimal_places: row[4],
#     created_at: row[5],
#     updated_at: row[6],
#     kind: row[7],
#     fx_eur: row[8],
#   })
# end
#
# # seeding for originators
# CSV.foreach(Rails.root.join("lib/seeds/originators.csv"), headers: false) do |row|
#  Originator.create({
#     :product_category_consumer
#     :product_category_business
#     :apr,
#     :contact_id,
#     :customer_category
#   }) 
# end
#
# # seeding platofirm_originators
# CSV.foreach(Rails.root.join("lib/seeds/platform_originators.csv"), headers: false) do |row|
#   PlatformOriginator.create({
#     id: row[0],
#     originator_id: row[1],
#     platform_id: row[2],
#     status: row[3],
#     skin_game: row[4],
#     grace_period: row[5],
#     rating: row[6],
#     length: row[7],
#     apr: row[8],
#     structure: row[9],
#     notes: row[10],
#     buyback: row[11],
#     buyback_principal: row[12],
#     buyback_interest: row[13],
#     buyback_activation: row[14],
#     created_at: row[15],
#     updated_at: row[16],
#     created_by: row[17],
#     updated_by: row[18],
#     currency_id: row[19],
#   })
# end
#
# # seeding transactions
# CSV.foreach(Rails.root.join("lib/seeds/transactions.csv"), headers: false) do |row|
#   Transaction.create({
#     :user_account_id, 
#     :loan_id, 
#     :property_id, 
#     :kind, 
#     :ref, 
#     :date, 
#     :time,
#     :category, 
#     :description, 
#     :amount, 
#     :notes, 
#     :shares, 
#     :share_price
#   })
# end
#
​# # seeding user accounts
# CSV.foreach(Rails.root.join("lib/seeds/user_accounts.csv"), headers: false) |row|
#   UserAccount.create({
#     country_id:row[0], 
#     account_id: row[1] 
#     currency_id: row[2] 
#     category: row[3]
#     name: row[4]
#     active: row[5]
#   })
# end
#
# #seeding for user_roles
# CSV.foreach(Rails.root.join("lib/seeds/users_roles.csv"), headers: false) do |row|
#     UsersRoles.create({
#     user_id: row[0],
#     role_id: row[1],
#   })
# end
#
#  # seeding for users
# CSV.foreach(Rails.root.join("lib/seeds/users.csv"), headers: false) do |row|
#   User.create({
#     id: row[0],
#     provider: row[1],
#     uid: row[2],
#     encrypted_password: row[3],
#     reset_password_token: row[4],
#     reset_password_sent_at: row[5],
#     allow_password_change: row[6],
#     remember_created_at: row[7],
#     username: row[8],
#     email: row[9],
#     currency_id: row[10],
#     country_id: row[11],
#     tokens: row[12],
#     created_at: row[13],
#     updated_at: row[14],
#     dob: row[15],
#     name: row[16],
#     surname: row[17],
#     contact_id: row[18],
#   })
# end
p '=============== Done! ==============='
