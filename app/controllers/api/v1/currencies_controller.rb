class Api::V1::CurrenciesController < ApplicationController
  before_action :set_currency, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user!

  # GET /currencies
  # GET /currencies.json
  def index
    @currencies = Currency.all
  end

  # GET /currencies/1
  # GET /currencies/1.json
  def show
  end

  # POST /currencies
  # POST /currencies.json
  def create
    @currency = Currency.new(currency_params)

    if @currency.save
      render :show, status: :created, location: @currency
    else
      render json: @currency.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /currencies/1
  # PATCH/PUT /currencies/1.json
  def update
    if @currency.update(currency_params)
      render :show, status: :ok, location: @currency
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
      params.require(:currency).permit(:name, :code, :symbol, :type, :decimal_places)
    end
end
