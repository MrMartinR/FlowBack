class Api::V1::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  # def render_create_success
  #   render json: {
  #     success: true,
  #     data: @resource,
  #     token: @token
  #   }, status: :ok
  # end

  def render_create_success
    render json: UserSerializer.new(@resource),
           status: :created, location: api_v1_user_path(@resource)
  end

  def sign_up_params
    params
      .require(:data)
      .require(:attributes)
      .permit(:username, :email, :uid, :password, :password_confirmation)
  end

  def account_update_params
    params
      .require(:data)
      .require(:attributes)
      .permit(:username, :email, :uid, :password, :password_confirmation)
  end
end
