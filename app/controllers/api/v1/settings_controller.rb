class Api::V1::SettingsController < Api::BaseController
  before_action :authenticate_api_v1_user!

  def index
    @user = current_api_v1_user
  end

  def create
    @user = current_api_v1_user
    if @user.update(user_params)
      render json: UserSerializer.new(@user, { fields: { user: [:username, :email, :currency_id, :country_id] } }).serializable_hash
    else
      render json: { status: 400, message: 'Could not update profile' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:uid, :username, :email, :password, :password_confirmation, :current_password, :currency_id, :country_id)
  end

  rescue_from ActionController::UnpermittedParameters do |error|
    message = "Invalid parameter: #{error.params.to_sentence}"
    message << 'Please verify that the parameter name is valid and the values are the correct type.'
    render_error 'param_error', status: :bad_request, locals: { exception: error, message: message }
  end
end
