class Api::V1::SettingsController < Api::BaseController
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
end
