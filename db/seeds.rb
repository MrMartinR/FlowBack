# Examples:
#
#   movies = Movie.find_or_create_by([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.find_or_create_by(name: 'Luke', movie: movies.first)
#
# This block creates 3 roles: admin, contributor and user
# [Working]
# rol admin
role_admin = Role.new({
  :id => "7a09ac89-a0e5-40a1-9ba2-73ab3c720c3f",
  :name => "admin",
  :created_at => "2020-12-30 16:14:03.071982",
  :updated_at => "2020-12-30 16:14:03.071982",
})
role_admin.save
# # rol contributor
# role_contributor = Role.new({
#   :id => "8f8c8dac-46a7-457c-8e6e-43cf02824535",
#   :name => "contributor",
#   :created_at => "2020-12-30 16:14:03.40272",
#   :updated_at => "2020-12-30 16:14:03.40272",
# })
# role_contributor.save
# # rol user
# role_user = Role.new({
#   :id => "d3de069c-a3c7-41b7-b61b-3e9a5498ba59",
#   :name => "user",
#   :created_at => "2020-12-30 16:14:03.534263",
#   :updated_at => "2020-12-30 16:14:03.534263",
# })
# role_user.save
# p "=============== Roles Seed Done! ==============="
# This block creates 4 users, 1 Admin, 1 Contributor and 2 User (Normal ones, or Flowers)
# [Working]
# # admin user
user_admin = User.new({
  :id => "90d8b89a-5b49-47c3-80b0-3038d67f7791",
  :email => "admin@flowfin.tech",
  :password => "admin1234",
  :username => "SuperFlower",
})
user_admin.add_role(:admin)
user_admin.save
# # contributor
# user_contrib = User.new({
#   :id => "53da15e0-06b1-47e1-93fd-74b47a884724",
#   :email => "contributor@flowfin.tech",
#   :password => "contributor1234",
#   :username => "ContriFlower",
# })
# # user_contrib.add_role(:contributor)
# user_contrib.save
# # normal user 1
# normal_user = User.new({
#   :id => "423307e5-db40-495c-8f81-b17b68a89005",
#   :email => "liquid@flowfin.tech",
#   :password => "liquid1234",
#   :username => "Liquid",
# })
# # normal_user.add_role(:user)
# normal_user.save
# # normal user 2
# normal_user = User.new({
#   :id => "b19d4423-5ae3-451a-b9df-ce6b1db44c56",
#   :email => "water@flowfin.tech",
#   :password => "water1234",
#   :username => "Water",
# })
# # normal_user.add_role(:user)
# normal_user.save
# p "=============== Users Seed Done! ==============="
# This block creates 4 rows in the table users_roles, 1 Admin, 1 Contributor and 2 User (Normal ones, or Flowers)
# Looks there is no model "UserRole" for this table..??? so not possible to do the manual way??
# [Not Working]
# admin
# user_rol_admin = UserRole.new({
#   :user_id => "90d8b89a-5b49-47c3-80b0-3038d67f7791",
#   :role_id => "7a09ac89-a0e5-40a1-9ba2-73ab3c720c3f",
# })
# user_rol_admin.save
# contributor
# user_rol_contributor = UserRole.new({
#   :user_id => "53da15e0-06b1-47e1-93fd-74b47a884724",
#   :role_id => "8f8c8dac-46a7-457c-8e6e-43cf02824535",
# })
# user_rol_contributor.save
# user 1
# user_rol_user = UserRole.new({
#   :user_id => "423307e5-db40-495c-8f81-b17b68a89005",
#   :role_id => "d3de069c-a3c7-41b7-b61b-3e9a5498ba59",
# })
# user_rol_user.save
# user 2
# user_rol_user = UserRole.new({
#   :user_id => "b19d4423-5ae3-451a-b9df-ce6b1db44c56",
#   :role_id => "d3de069c-a3c7-41b7-b61b-3e9a5498ba59",
# })
# user_rol_user.save
# p "=============== Users Roles Seed Done! ==============="
# Note, this method will show error if you try to run rake db:seed more
# than 1 time, because this method not update the rows.. to make test, you have to
# truncate the tables in order to delete the rows... (pgAdmin Right click on the table > truncate)
# Delete this comment after you finish importing the rest of the files.
# Here the source https://itnext.io/how-to-seed-a-rails-database-with-a-csv-file-105a7ba0e88c
# I am having drama with the csv format, because the quotes and the json fields..
# search the rainvow csv extension on the vscode marketplace, and check the csvs
#  I go to sleep, I left the PlatformOriginator table unfinished.. try with few data and make it work..
# if you cannot do it, try another files.. we dont need to use all the rows.. if some row makes you problem, delete it fron the csv
require "csv"
# Roles [Not Working] ...  methods(controllers) not implemented
# CSV.foreach(Rails.root.join("lib/seeds/roles.csv"), headers: false) do |row|
#   Roles.create({
#     id: row[0],
#     name: row[1],
#     resource_type: row[2],
#     resource_id: row[3],
#     created_at: row[4],
#     updated_at: row[5],
#   })
# end
p "=============== roles-CSV Seed                ->  [Work in progress]! ==============="
# Users Roles [Not Working] NameError: uninitialized constant UsersRoles
# CSV.foreach(Rails.root.join("lib/seeds/users_roles.csv"), headers: false) do |row|
#   UsersRoles.create({
#     user_id: row[0],
#     role_id: row[1],
#   })
# end
p "=============== users_roles-CSV Seed          ->  [Work in progress]! ==============="
# Currencies [Working]
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
p "=============== currency-CSV Seed             ->       [Functioning]! ==============="
# [Not Working] Issue with inconsistent data in the csv file
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
p "=============== platform_originators-CSV Seed ->  [Work in progress]! ==============="
# [Not Working] Issue with inconsistent data in the csv file
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
p "=============== transactions-CSV Seed         ->  [Work in progress]! ==============="
# [Working]
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
p "=============== user_accounts-CSV Seed        ->       [Functioning]! ==============="
# [Working]
# CSV.foreach(Rails.root.join("lib/seeds/users_roles.csv"), headers: false) do |row|
#     UsersRoles.create({
#     user_id: row[0],
#     role_id: row[1],
#   })
# end
p "=============== users_roles-CSV Seed          ->       [Functioning]! ==============="
# [Not Working] Issue with inconsistent data in the csv file
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
p "=============== users-CSV Seed                ->  [Work in progress]! ==============="
# [Working]
# CSV.foreach(Rails.root.join("lib/seeds/originators.csv"), headers: false) do |row|
#  Originator.create({
#     product_category_consumer: row[9]
#     product_category_business: row[10]
#     :apr,
#     :contact_id,
#     customer_category: row[5]
#   }) 
# end
#
p "=============== originators-CSV Seed          ->  [Work in progress]! ==============="
# [Working]
# CSV.foreach(Rails.root.join("lib/seeds/countries.csv"), headers: false) do |row|
#   Country.create({
#     currency_id: row[0]
#     name: row[1]
#     iso_code: row[2]
#     continent: row[3]
#     flag: row[4]
p "=============== countries-CSV Seed            ->       [Functioning]! ==============="

p "=============== All Seeds Done!               ->  [Work in progress]! ==============="