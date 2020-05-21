task :import_data => :environment do
  require 'csv'
  # currencies export
  #Currency.delete_all
  path = Rails.root.to_s + '/public/currencies.csv'
  puts path
  CSV.foreach(path, 'r') do |row|
    # ...
    # skip header
    next if row[1].to_s == "fx_eur"
    puts row
    if Currency.where("name = ?", row[2]).blank?
      Currency.create(
                  id: row[0].to_s,
                 # fx_eur: nil,
                  name: row[2].to_s,
                  code: row[3].to_s,
                  symbol: row[4],
                  kind: row[5]
      )
    end
  end

  #Country.delete_all
  path = Rails.root.to_s + '/public/countries.csv'
  puts path
  CSV.foreach(path, 'r') do |row|
    # ...
    # skip header
    next if row[1].to_s == "currency_id"
    puts row
    if Country.where("name = ?", row[4]).blank?
      Country.create(
          id: row[0].to_s,
          # fx_eur: nil,
          currency_id: row[1].to_s,
          continent: row[2].to_s,
          iso_code: row[3],
          name: row[4]
      )
    end
  end

  path = Rails.root.to_s + '/public/accounts.csv'
  puts path
  CSV.foreach(path, 'r') do |row|
    # ...
    # skip header
    next if row[1].to_s == "currency_id"
    puts row
    if Account.where("name = ?", row[4]).blank?
      Account.create(
          platform_id: row[0].to_s,
          # fx_eur: nil,
          currency_id: row[1].to_s,
          name: row[2],
          category: row[3],
          country_id: row[4]
      )
    end
  end
end