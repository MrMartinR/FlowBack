class Api::V1::UserPlatformsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_user_platform, only: %i[update destroy]

  def index
    user_platforms = current_user.user_platforms.order('created_at desc')

    render json: UserPlatformsSerializer.new(user_platforms),
           status: :ok
  end

  def create
    user_platform = current_user.user_platforms.create!(user_platform_params)

    render json: UserPlatformsSerializer.new(user_platform),
           status: :created, location: api_v1_user_platform_path(user_platform)
  end

  def update
    @user_platform.update!(user_platform_params)
    render json: UserPlatformsSerializer.new(@user_platform),
           status: :ok
  end

  def destroy
    if @user_platform.destroy
      render json: { meta: { message: 'User Platform successfully deleted' } },
             status: :ok
    else
      json_response({ success: false, message: @user_platform.errors }, :unprocessable_entity)
    end
  end

  private

  def set_user_platform
    @user_platform = current_user.user_platforms.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_platform_params
    stamp_params = {}.tap do |h|
      h[:updated_by] = current_user.id
      h[:created_by] = current_user.id if params[:action] == 'create'
    end

    params
      .require(:data)
      .require(:attributes)
      .permit(:platform_id, :overview, :notes, :login_user, :id,
              :login_pass, :internal_id, :strategy, :rating)
      .merge(stamp_params)
  end
end
