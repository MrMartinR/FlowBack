class Api::V1::SessionsController < DeviseTokenAuth::SessionsController

  def create
    super
  end

  def render_create_success
      render json: {
          success: true,
          data: @resource,
          token: @token
      }, status: 200
  end

  private

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end

  def resource_params
    params.require(:user).permit(*params_for_resource(:sign_in))
  end
end
