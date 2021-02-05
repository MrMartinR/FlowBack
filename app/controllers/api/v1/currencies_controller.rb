class Api::V1::CurrenciesController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :admin_or_contributor!, except: %i[index show]
  before_action :set_currency, only: %i[show update destroy]

  # GET /currencies
  # GET /currencies.json
  def index
    @currencies = Currency.order('currencies.name asc')
    render json: CurrencySerializer.new(@currencies).serializable_hash
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
        render json: CurrencySerializer.new(@currency).serializable_hash
      else
        render json: @currency.errors, status: :unprocessable_entity
      end
    else
      @find_currency.errors.add(:show, message: 'Currency already exists!')
      render json: @find_currency.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /currencies/1
  # PATCH/PUT /currencies/1.json
  def update
    if @currency.update(currency_params)
      render json: CurrencySerializer.new(@currency).serializable_hash
    else
      render json: @currency.errors, status: :unprocessable_entity
    end
  end

  # DELETE /currencies/1
  # DELETE /currencies/1.json
  def destroy
    if @currency.destroy
      json_response({ success: true, message: 'The currency was deleted' })
    else
      json_response({ success: false, message: @contact.errors }, :unprocessable_entity)
    end
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
