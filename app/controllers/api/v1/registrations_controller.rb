class Api::V1::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def render_create_success
    render json: {
      success: true,
      data: @resource,
      token: @token
    }, status: :ok
  end

  def sign_up_params
    params
      .require(:data)
      .require(:attributes)
      .permit(:username, :email, :uid, :password, :password_confirmation, :name, :country_id)
  end

  def account_update_params
    params
      .require(:data)
      .require(:attributes)
      .permit(:username, :email, :uid, :password, :password_confirmation)
  end
end
