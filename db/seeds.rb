# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

# admin user
user = User.new({
                    :email => "admin@flowapp.com",
                    :password => "flowapp12345678",
                    :username => "FLOW APP ADMIN"
                })
user.save!
user.add_role(:admin)

# contributor
user = User.new({
                    :email => "contrib@flowapp.com",
                    :password => "flowapp12345678",
                    :username => "FLOW APP CONTRIBUTOR"
                })
user.save!
user.add_role(:contributor)


1.upto(10) do |i|
  user = User.new({
                      :email => "test#{i}@example.com",
                      :password => "1234567",
                      :username => "test#{i} uname"
                  })
  user.save!
end

1.upto(20) do |i|
  Platform.create!({
                      :contact_id => "contact_id #{i}",
                      :category => "category #{i}",
                      :status => "#{i}",
                      :liquidity => "#{i}",
                      :term => "#{i}",
                      :invest_mode => "#{i}",
                      :min_investment => "#{i}",
                      :secondary_market => "#{i}",
                      :taxes => "#{i}",
                      :cashflow_options => "#{i}",
                      :protection_scheme => "#{i}",
                      :cost => "#{i}",
                      :profitable => true,
                      :ifisa => true,
                      :structure => "structure #{i}",
                      :account_category => "contact_id",
                      :welcome_bonus => "welcome_bonus #{i}",
                      :promo => "promo #{i}",
                      :promo_end => Date.today + rand(1..100).days,
                      :icon => "contact_id",
                      :logo => "contact_id"
                  })
end

1.upto(20) do |i|
  UserAccount.create!({
                          :country_id => Country.order("RANDOM()").first.id,
                          :account_id => Account.order("RANDOM()").first.id,
                          :platform_id => Platform.order("RANDOM()").first.id,
                          :currency_id => Currency.order("RANDOM()").first.id,
                          :user_id => User.order("RANDOM()").first.id,
                          :category => "Category {i}",
                          :name => "User Account Name #{i}",
                          :total_fee => rand(0..100),
                          :total_loss => rand(0..100),
                          :total_tax => rand(0..10),
                          :active => true,
                          :total_invest => rand(0..100),
                          :total_profit => rand(0..100),
                          :total_referral => rand(0..100),
                          :total_interest => rand(0..100),
                          :total_bonus => rand(0..100)
                      })
end



