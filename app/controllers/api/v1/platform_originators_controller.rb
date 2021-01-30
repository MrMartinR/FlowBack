class Api::V1::PlatformOriginatorsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :admin_or_contributor!, except: :index
  before_action :set_platform_originator, only: %i[show update destroy]
  before_action :set_platform, only: :index_by_platform_id

  def index
    @platform_originators = []
    PlatformOriginator.find_each do |account|
      dt = data_return(account)
      @platform_originators << dt
    end
    json_response({ success: true, message: @platform_originators })
  end

  def index_by_platform_id
    @platform_originators = []
    PlatformOriginator.all.where('platform_id = ?', @platform.id).each do |account|
      dt = data_return(account)
      @platform_originators << dt
    end
    json_response({ success: true, message: @platform_originators })
  end

  def show
    @data = data_return(@platform_originator)
    json_response({ success: true, message: @data })
  end

  def create
    @platform_originator = PlatformOriginator.new(platform_originator_params)
    if @platform_originator.save
      @data = data_return(@platform_originator)
      json_response({ success: true, message: @data })
    else
      json_response({ success: false, message: @platform_originator.errors }, :unprocessable_entity)
    end
  end

  def update
    if @platform_originator.update(platform_originator_params)
      @data = data_return(@platform_originator)
      json_response({ success: true, message: @data })
    else
      json_response({ success: false, message: @platform_originator.errors }, :unprocessable_entity)
    end
  end

  def destroy
    if @platform_originator.destroy
      json_response({ success: true, message: 'Platform originator deleted' })
    else
      json_response({ success: false, message: @platform_originator.errors }, :unprocessable_entity)
    end
  end

  private

  def set_platform_originator
    @platform_originator = PlatformOriginator.find(params[:id])
  end

  def set_platform
    @platform = Platform.find(params[:id])
  end

  def platform_originator_params
    params.require(:platform_originator).permit(:originator_id, :platform_id, :status, :skin_game, :grace_period,
                                                :rating, :length, :apr, :structure, :notes, :buyback, :buyback_principal, :buyback_interest, :buyback_activation, currency_id: [])
  end

  def data_return(platform_originator)
    account = platform_originator
    dt = Hash.new(0)
    dt[:id] = account.id
    dt[:originator] = account.originator
    dt[:status] = account.status
    dt[:platform] = account.platform
    all_currencies = []
    account.currency_id.each do |id|
      all_currencies << Currency.find(id) unless id.nil?
    end
    dt[:currency] = all_currencies
    dt[:skin_game] = account.skin_game
    dt[:grace_period] = account.grace_period
    dt[:rating] = account.rating
    dt[:length] = account.length
    dt[:apr] = account.apr
    dt[:structure] = account.structure
    dt[:notes] = account.notes
    dt[:buyback] = account.buyback
    dt[:buyback_principal] = account.buyback_principal
    dt[:buyback_interest] = account.buyback_interest
    dt[:buyback_activation] = account.buyback_activation

    dt
  end
end
