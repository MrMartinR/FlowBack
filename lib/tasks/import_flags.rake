task :import_flags => :environment do
  [Country.first].each do |country|
    path = Rails.root.to_s + "/public/flags/#{country.iso_code}.svg"
    puts path
    country.flag_image.attach(io: File.open(path), filename: "#{country.iso_code}.svg")
  end
end