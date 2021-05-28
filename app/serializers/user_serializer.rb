class UserSerializer
  include JSONAPI::Serializer

  # mixes in your helper method as class method
  extend ApplicationHelper

  #sets the type of serializer
  set_type :user

  #The attributes needed in response
  # attributes :email, :username, :surname, :name, :country, :currency
  attributes :email, :username, :contact_id, :preferences, :kanban

  #for serializing image url
  attribute :image_url do |user|
    if user.avatar&.attached?
      # json.avatar_url Rails.application.routes.url_helpers.rails_representation_url(user.avatar.variant(resize: "400x400").processed, only_path: true) rescue ""
      begin
        `https://api.flowfin.tech #{Rails.application.routes.url_helpers.rails_representation_url(
            user.avatar.variant(resize: '400x400').processed, only_path: true
        )}`
      rescue StandardError
        ''
      end
    else
      gravatar_img_url(user.email)
    end
  end

  #for getting formatted dob
  # attribute :dob do |user|
  #   date_format(user.dob)
  # end
end
