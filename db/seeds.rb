def rand_float
  rand(0..20)
end

def rand_int
  rand(1..100)
end

def rand_bool
  [true, false].sample
end

def rand_country
  Country.order("RANDOM()").first
end

def rand_currency
  Currency.order("RANDOM()").first
end

def rand_originator
  Originator.order("RANDOM()").first
end

def rand_platform
  Platform.order("RANDOM()").first
end

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

  Originator.delete_all
  1.upto(20) do |i|
     Originator.create({
                           :name => "Originator #{i}",
                           :product_type_individuals => "Product Type individual #{i}" ,
                           :product_type_companies => "product_type_companies #{i}",
                           :length=> "length #{i}",
                           :default_rate=> rand(1..10),
                           :air=> rand(1..10),
                           :xirr=> rand(1..10),
                           :rating=> rand(1..10),
                           :apr=> rand(1..10),
                           :logo=> "img #{i}",
                           :icon=> "icon #{i}",
                           :website => "web #{i}"
                       })

  end

  PlatformOriginator.delete_all
  1.upto(20) do |i|
    PlatformOriginator.create!({
                                   :originator_id => Originator.order('random()').first.id,
                                   :platform_id=> Platform.order('random()').first.id,
                                   :status=> "Acvite",
                                   :skin_game=> rand_float,
                                   :grace_period=> rand_int,
                                   :rating=> rand_int,
                                   :length=> "Length",
                                   :apr=> rand_float,
                                   :structure=> "structure",
                                   :notes=> "notes for Platform originator",
                                   :buyback=> "buyback"+rand_int.to_s,
                                   :buyback_principal=> rand_bool,
                                   :buyback_interest=> rand_bool,
                                   :buyback_activation => rand_int
                               })
  end


  1.upto(20) do |i|
  attr = {
      :country_id => rand_country.id,
      :currency_id => rand_currency.id,
      :originator_id => rand_originator.id,
      :platform_id => rand_platform.id,
      :code => "code #{i}",
      :internal_code => "code #{i}",
      :name => "code #{i}",
      :borrower => "code #{i}",
      :gender => "code #{i}",
      :air => "code #{i}",
      :status => "code #{i}",
      :xirr => "code #{i}",
      :rating => "code #{i}",
      :dti_rating => "code #{i}",
      :borrower_type => "code #{i}",
      :category => "code #{i}",
      :amount => "code #{i}",
      :description => "code #{i}",
      :link => "code #{i}",
      :secured_buyback => "code #{i}",
      :secured_personal => "code #{i}",
      :secured_collaretal => "code #{i}",
      :security => "code #{i}",
      :date_listed => "code #{i}",
      :date_issued => "code #{i}",
      :date_maturity => "code #{i}",
      :amortization => "code #{i}",
      :installment => "code #{i}",
      :notes => "Notes #{i}"
  }
  Loan.create!(attr)
end

end



