class Api::V1::PlatformsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :admin_or_contributor!, except: %i[index show]
  before_action :set_platform, only: %i[show update destroy]

  def index
    @platforms = Platform.order('created_at asc')
  end

  def show; end

  def create
    @platform = Platform.new(platform_params)

    if @platform.save
      render :show, status: :created
    else
      json_response({ success: false, message: @platform.errors }, :unprocessable_entity)
    end
  end

  def update
    if @platform.update(platform_params)
      render :show, status: :ok
    else
      json_response({ success: false, message: @platform.errors }, :unprocessable_entity)
    end
  end

  def destroy
    if @platform.destroy
      json_response({ success: true, message: 'Platform deleted' })
    else
      json_response({ success: false, message: @platform.errors }, :unprocessable_entity)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_platform
    @platform = Platform.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def platform_params
    merged_params = { updated_by: @user.id }
    merged_params = { created_by: @user.id } if params[:action] == 'create'
    params.require(:platform).permit(:contact_id, :category, :status,
                                     :liquidity, :term, :invest_mode,
                                     :min_investment, :secondary_market,
                                     :taxes, :cashflow_options, :protection_scheme, :cost,
                                     :profitable, :ifisa, :structure, :account_category,
                                     :welcome_bonus, :promo, :promo_end, :sm_notes).merge(merged_params)
  end
end
