task :import_flags => :environment do
  Country.all.each do |country|
    begin
      path = Rails.root.to_s + "/public/flags/#{country.iso_code}.svg"
      if country.flag_image.attached?
        puts "Country #{country.name} has flag already"
      else
        country.flag_image.attach(io: File.open(path), filename: "#{country.iso_code}.svg")
      end
    rescue => e
      puts "ERROR #{country.name}"
    end
  end
end
