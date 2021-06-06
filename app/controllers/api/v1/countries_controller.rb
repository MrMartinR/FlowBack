class Api::V1::CountriesController < Api::BaseController
  before_action :authenticate_api_v1_user!, :admin_or_contributor!
  before_action :admin_or_contributor!, except: %i[index show]
  before_action :set_country, only: %i[show update destroy]

  # GET /countries
  # GET /countries.json
  def index
    @countries = Country.includes(:currency).order('countries.name asc')
    # @images = Country.with_attached_flag_image
    render json: CountrySerializer.new(@countries).serializable_hash
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
    render json: CountrySerializer.new(@country).serializable_hash
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)

    if @country.save
      render json: CountrySerializer.new(@country).serializable_hash
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    if @country.update(country_params)
      render json: CountrySerializer.new(@country).serializable_hash
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    if @country.destroy
      json_response({ success: true, message: 'The country was deleted' })
    else
      json_response({ success: false, message: @country.errors }, :unprocessable_entity)
    end
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
