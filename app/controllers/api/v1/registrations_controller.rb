class Api::V1::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

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

  def render_create_success
    render json: UserSerializer.new(@resource),
           status: :created, location: api_v1_user_path(@resource)
  end

  def render_create_error
    render json: ErrorSerializer.new(@resource).serialize,
           status: :unprocessable_entity
  end

  def render_update_success
    render json: UserSerializer.new(@resource),
           status: :ok
  end

  def render_update_error
    render json: ErrorSerializer.new(@resource).serialize,
           status: :unprocessable_entity
  end
end
