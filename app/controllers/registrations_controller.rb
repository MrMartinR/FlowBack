class RegistrationsController < Devise::RegistrationsController
  def create

  end

  def update
    super
  end

  protected

  def after_sign_up_path_for(resource)
    settings_path # Or :prefix_to_your_route
  end

  def account_update_params
    params.require(:user).permit(:uid, :username, :email,  :password, :password_confirmation, :current_password,:currency_id, :country_id)
  end
end