class ImageAssetSerializer
  include JSONAPI::Serializer
  #sets the type of serializer
  set_type :image_asset
  #The attributes needed in response
  attributes :uid, :category, :logo, :icn
end