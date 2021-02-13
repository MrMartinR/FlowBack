class Api::V1::PlatformsController < Api::BaseController
  before_action :admin_or_contributor!, except: :index
  before_action :set_platform, only: %i[update destroy]

  def index
    platforms = Platform.all
    render json: PlatformsSerializer.new(platforms),
           status: :ok
  end

  def create
    platform = Platform.create!(platform_params)

    render json: PlatformsSerializer.new(platform),
           status: :created, location: api_v1_platform_path(platform)
  end

  def update
    @platform.update!(platform_params)
    render json: PlatformsSerializer.new(@platform),
           status: :ok
  end

  def destroy
    if @platform.destroy
      render json: { meta: { message: 'Platform successfully deleted' } },
             status: :ok
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
    merged_params = { updated_by: current_user.id }
    merged_params = { created_by: current_user.id } if params[:action] == 'create'

    params
      .require(:data)
      .require(:attributes)
      .permit(:contact_id, :category, :status,
              :liquidity, :term, :invest_mode,
              :min_investment, :secondary_market,
              :taxes, :cashflow_options, :protection_scheme, :cost,
              :profitable, :ifisa, :structure, :account_category,
              :welcome_bonus, :promo, :promo_end, :sm_notes)
      .merge(merged_params)
  end
end
