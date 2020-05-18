class Api::V1::PlatformsController < Api::BaseController
  before_action  :authenticate_api_v1_user!
  before_action :admin_or_contributor!, except: [:index, :show]
  before_action :set_platform, only: [:show, :update, :destroy]

  def index
    if params[:page].blank?
      @platforms = Platform.order('category asc')
    else
      @platforms = Platform.order('category asc').paginate(page: params[:page], per_page: params[:per_page])
      @total_pages = Platform.order('category asc').paginate(page: params[:page], per_page: params[:per_page]).total_pages
    end
  end

  def search
    @search = Platform.ransack(params[:q])
    @platforms = @search.result(distinct: true).paginate(page: params[:page], per_page: params[:per_page])
    @search.build_condition

    render :index
  end

  def show
  end

  def create
    @platform = Platform.new(platform_params)

    if @platform.save
      render :show, status: :created
    else
      json_response({success:false, :message => @platform.errors},:unprocessable_entity)
    end
  end

  def update
    if @platform.update(platform_params)
      render :show, status: :ok
    else
      json_response({success:false, :message => @platform.errors},:unprocessable_entity)
    end
  end

  def destroy
    @platform.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platform
      @platform = Platform.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def platform_params
      params.require(:platform).permit(:contact_id, :category, :status, :liquidity, :term, :invest_mode, :min_investment, :secondary_market, :taxes, :cashflow_options, :protection_scheme, :cost, :profitable, :ifisa, :structure, :account_category, :welcome_bonus, :promo, :promo_end, :icon, :logo)
    end
end
