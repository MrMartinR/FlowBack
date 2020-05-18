class Api::V1::PlatformOriginatorsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  #before_action :admin_or_contributor!, except: :index
  before_action :set_platform_originator, only: [:show, :update, :destroy]

  def index
    if params[:page].blank?
      @platform_originators = PlatformOriginator.order('created_at desc')
    else
      @platform_originators = PlatformOriginator.order('created_at desc').paginate(page: params[:page], per_page: params[:per_page])
      @total_pages = PlatformOriginator.order('created_at desc').paginate(page: params[:page], per_page: params[:per_page]).total_pages
    end
  end

  def show
  end

  def create
    @platform_originator = PlatformOriginator.new(platform_originator_params)

    if @platform_originator.save
      render :show, status: :created
    else
      json_response({success:false, :message => @platform_originator.errors},:unprocessable_entity)
    end
  end

  def update
    if @platform_originator.update(platform_originator_params)
      render :show, status: :ok
    else
      json_response({success:false, :message => @platform_originator.errors},:unprocessable_entity)
    end
  end

  def destroy
    @platform_originator.destroy
  end

  private
    def set_platform_originator
      @platform_originator = PlatformOriginator.find(params[:id])
    end

    def platform_originator_params
      params.require(:platform_originator).permit(:originator_id, :platform_id, :status, :skin_game, :grace_period, :rating, :length, :apr, :structure, :notes, :buyback, :buyback_principal, :buyback_interest, :buyback_activation)
    end
end
