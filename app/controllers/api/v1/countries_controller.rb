class Api::V1::CountriesController < ApplicationController
  before_action :set_country, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user!

  # GET /countries
  # GET /countries.json
  def index
    @countries = Country.includes(:currency).order('countries.name asc')
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)

    if @country.save
      render :show, status: :created, location: @country
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    if @country.update(country_params)
      render :show, status: :ok, location: @country
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_params
      params.require(:country).permit(:currency_id, :name, :iso_code, :continent, :flag)
    end
end
