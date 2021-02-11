class Api::V1::SessionsController < DeviseTokenAuth::SessionsController
  protected

  def render_create_success
    render json: UserSerializer.new(@resource),
           status: :created
  end

  def render_create_error_bad_credentials
    render json: { errors: [{ detail: I18n.t('devise_token_auth.sessions.bad_credentials') }] },
           status: :unauthorized
  end

  def render_destroy_success
    render json: { meta: { message: 'Signed out successfully' } },
           status: :ok
  end

  def render_destroy_error
    render json: { errors: [{ detail: I18n.t('devise_token_auth.sessions.user_not_found') }] },
           status: :not_found
  end

  private

  def resource_params
    params
      .require(:data)
      .require(:attributes)
      .permit(:email, :password)
  end
end
