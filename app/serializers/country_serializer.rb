class CountrySerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :country
  #The attributes needed in response
  attributes :name, :iso_code, :continent, :currency

  #for getting flag url
  attribute :flag do |country|
    country.flag_image.attached? ? Rails.application.routes.url_helpers.rails_blob_path(country.flag_image,  only_path: true) : nil
  end
end