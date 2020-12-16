class Api::V1::CurrenciesController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :admin_or_contributor!, except: [:index, :show]
  before_action :set_currency, only: [:show, :update, :destroy]


  # GET /currencies
  # GET /currencies.json
  def index
    @currencies = Currency.order('currencies.name asc')
  end

  # GET /currencies/1
  # GET /currencies/1.json
  def show; end

  # POST /currencies
  # POST /currencies.json
  def create
    @find_currency = Currency.find_by(name: currency_params[:name])
    if @find_currency.nil?
      @currency = Currency.new(currency_params)
      if @currency.save
        render json: index
      else
        render json: @currency.errors, status: :unprocessable_entity
      end
    else
      @find_currency.errors.add(:show, message: 'Account already exist!')
      render json: @find_currency.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /currencies/1
  # PATCH/PUT /currencies/1.json
  def update
    if @currency.update(currency_params)
      render :show, status: :ok
    else
      render json: @currency.errors, status: :unprocessable_entity
    end
  end

  # DELETE /currencies/1
  # DELETE /currencies/1.json
  def destroy
    @currency.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency
      @currency = Currency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def currency_params
      params.require(:currency).permit(:name, :code, :symbol, :kind, :decimal_places, :fx_eur)
    end
end
