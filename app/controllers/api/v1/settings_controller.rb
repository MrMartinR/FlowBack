class Api::V1::SettingsController < Api::BaseController
  before_action :authenticate_api_v1_user!

  def index
    render json: UserSerializer.new(current_user),
           status: :ok
  end

  def update
    if current_user.update(user_params)
      render json: UserSerializer.new(current_user),
             status: :ok
    else
      render json: ErrorSerializer.new(current_user).serialize,
             status: :unprocessable_entity
    end
  end

  private

  def user_params
    params
      .require(:data)
      .require(:attributes)
      .permit(:uid, :username, :email, :password, :password_confirmation, :current_password, :currency_id, :country_id)
  end

  rescue_from ActionController::UnpermittedParameters do |error|
    message = "Invalid parameter: #{error.params.to_sentence}"
    message << 'Please verify that the parameter name is valid and the values are the correct type.'
    render_error 'param_error', status: :bad_request, locals: { exception: error, message: message }
  end
end
