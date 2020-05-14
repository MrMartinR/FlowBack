class Api::V1::PlatformsController < ApplicationController
  before_action :set_platform, only: [:show, :update, :destroy]

  # GET /platforms
  # GET /platforms.json
  def index
    if params[:page].blank?
      @platforms = Platform.includes(:currency, :country).order('accounts.name asc')
    else
      @platforms = Platform.order('category asc').paginate(page: params[:page])
      @total_pages = Platform.order('category asc').paginate(page: params[:page]).total_pages
    end
  end

  # GET /platforms/1
  # GET /platforms/1.json
  def show
  end

  # POST /platforms
  # POST /platforms.json
  def create
    @platform = Platform.new(platform_params)

    if @platform.save
      render :show, status: :created, location: @platform
    else
      render json: @platform.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /platforms/1
  # PATCH/PUT /platforms/1.json
  def update
    if @platform.update(platform_params)
      render :show, status: :ok, location: @platform
    else
      render json: @platform.errors, status: :unprocessable_entity
    end
  end

  # DELETE /platforms/1
  # DELETE /platforms/1.json
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
