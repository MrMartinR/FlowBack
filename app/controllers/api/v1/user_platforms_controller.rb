class Api::V1::UserPlatformsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_user_platform, only: %i[show update destroy]

  def index
    @user_platforms = @user.user_platforms.order('created_at desc')
  end

  def show; end

  def create
    @user_platform = @user.user_platforms.new(user_platform_params)

    if @user_platform.save
      render :show, status: :created
    else
      json_response({ success: false, message: @user_platform.errors }, :unprocessable_entity)
    end
  end

  def update
    if @user_platform.update(user_platform_params)
      render :show, status: :ok
    else
      json_response({ success: false, message: @user_platform.errors }, :unprocessable_entity)
    end
  end

  def destroy
    if @user_platform.destroy
      json_response({ success: true, message: 'User platform  deleted' })
    else
      json_response({ success: false, message: @user_platform.errors }, :unprocessable_entity)
    end
  end

  private

  def set_user_platform
    @user_platform = @user.user_platforms.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_platform_params
    merged_params = { updated_by: @user.id }
    merged_params = { created_by: @user.id } if params[:action] == 'create'
    merged_params = { user_id: @user.id }

    params.require(:user_platform).permit(:platform_id, :overview, :strategy, :login_user, :login_pass,
                                          :internal_id, :notes, :rating)
      .merge(merged_params)
  end
end
