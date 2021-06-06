class Api::V1::ImageAssetsController < Api::BaseController
  before_action :set_icon, only: %i[show update destroy]

  def index
    # @rev this regex is for something??
    uuid_regex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
    if params[:uid].present? && uuid_regex.match?(params[:uid].to_s.downcase).eql?(false)
      render json: { success: false, message: 'Wrong Format uuid!' }, status: :unprocessable_entity
    else
      @icons = ImageAsset.by_category(params[:category]).by_uid(params[:uid])
      render json: ImageAssetSerializer.new(@icons).serializable_hash
    end
  end

  def show; end

  def create
    @icon = ImageAsset.new(icon_params)

    if @icon.save
      render json: ImageAssetSerializer.new(@icon).serializable_hash
    else
      render json: @icon.errors, status: :unprocessable_entity
    end
  end

  def update
    if @icon.update(icon_params)
      render json: ImageAssetSerializer.new(@icon).serializable_hash
    else
      render json: @icon.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @icon.destroy
  end

  private

  def set_icon
    @icon = ImageAsset.find(params[:id])
  end

  def icon_params
    params.require(:icon).permit(:id, :uid, :category, :logo, :icn)
  end
end
