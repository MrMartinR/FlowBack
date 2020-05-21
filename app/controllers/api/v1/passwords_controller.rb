class Api::V1::PasswordsController < DeviseTokenAuth::PasswordsController
  def create
    @user = User.find_by(email: params['email'])
    params['email'] = @user.email if @user

    super
  end

  def render_edit_error
    render json: {success: false, code: 404, message: "Not Found"}
  end

  private

  def forgot_params
    params.permit(:email, :password, :redirect_url)
  end
end
