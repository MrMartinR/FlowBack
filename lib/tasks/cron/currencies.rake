# require 'net/http'

# namespace :cron do
#   namespace :currencies do
#     desc 'Update the current exchange rate'
#     task exchange_service: :environment do
#       default_code = 'EUR'

#       currency_exchange = currency_exchange(default_code)

#       unless currency_exchange.blank?
#         Currency.where('currencies.code != ?', default_code).each do |currency|
#           next if currency.code.blank?

#           new_fx_eur = currency_exchange['rates'][currency.code.to_s]
#           next if new_fx_eur.blank?

#           old_fx_eur = currency.fx_eur
#           puts "#{currency.code} updating from #{old_fx_eur} to #{new_fx_eur}" if new_fx_eur != old_fx_eur && currency.update(fx_eur: new_fx_eur.to_f)
#         end
#       end
#     end

#     def currency_exchange(default_code)
#       uri = URI.parse("https://api.ratesapi.io/api/latest?base=#{default_code}")
#       http = Net::HTTP.new(uri.host, uri.port)
#       http.use_ssl = true
#       # do request
#       request = Net::HTTP::Get.new(uri.path)
#       # response
#       response = http.start { |http| http.request(request) }
#       return JSON.parse(response.body) if response.message == 'OK'
#     end
#   end
# end
