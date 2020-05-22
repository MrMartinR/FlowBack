class Api::V1::UserPlatformsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_user_platform, only: [:show, :update, :destroy]

  def index
    if params[:page].blank?
      @user_platforms = @user.user_platforms.order('created_at desc')
    else
      @user_platforms = @user.user_platforms.order('created_at desc').paginate(page: params[:page],per_page: params[:per_page])
      @total_pages = @user.user_platforms.paginate(page: params[:page],per_page: params[:per_page]).total_pages
    end
  end

  def show
  end

  def create
    @user_platform = @user.user_platforms.new(user_platform_params)

    if @user_platform.save
      render :show, status: :created
    else
      json_response({success:false, :message => @user_platform.errors},:unprocessable_entity)
    end
  end

  def update
    if @user_platform.update(user_platform_params)
      render :show, status: :ok
    else
      json_response({success:false, :message => @user_platform.errors},:unprocessable_entity)
    end
  end

  def destroy
    @user_platform.destroy
  end

  private
    def set_user_platform
      @user_platform = @user.user_platforms.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_platform_params
      params.require(:user_platform).permit(:user_id, :platform_id, :overview, :strategy, :user, :pass, :internal_id, :notes, :rating, :xirr, :total_loss, :air).
          merge(created_by: @user.id, updated_by: @user.id)
    end
end
