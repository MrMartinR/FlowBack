class RegistrationsController < Devise::RegistrationsController
  def create

  end
  protected

  def after_sign_up_path_for(resource)
    settings_path # Or :prefix_to_your_route
  end
end