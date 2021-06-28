class CountrySerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :country
  #The attributes needed in response
  attributes :name, :iso_code, :continent, :currency, :fiscal_year_start

  #for getting flag url
  # FIXME I did commented this piece of code in order to prevent thousands of queries,
  # the flags now are fetched from the frontend, I left this code for review
  # attribute :flag do |country|
  #   country.flag_image.attached? ? Rails.application.routes.url_helpers.rails_blob_path(country.flag_image,  only_path: true) : nil
  # end
end