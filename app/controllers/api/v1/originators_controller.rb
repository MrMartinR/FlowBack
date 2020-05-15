class Api::V1::OriginatorsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_originator, only: [:show, :update, :destroy]


  def index
    if params[:page].blank?
      @originators = Originator.order('name asc')
    else
      @originators = Originator.order('name asc').paginate(page: params[:page],per_page: params[:per_page])
      @total_pages = Originator.paginate(page: params[:page],per_page: params[:per_page]).total_pages
    end
  end

  def show

  end

  def create
    @originator = Originator.new(originator_params)

    if @originator.save
      render :show, status: :created
    else
      render json: @originator.errors, status: :unprocessable_entity
    end
  end

  def update
    if @originator.update(originator_params)
      render :show, status: :ok
    else
      render json: @originator.errors, status: :unprocessable_entity
    end
  end

  # DELETE /originators/1
  # DELETE /originators/1.json
  def destroy
    @originator.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_originator
    @originator = Originator.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def originator_params
    params.require(:originator).permit(:name, :product_type_individuals, :product_type_companies, :length, :default_rate, :air, :xirr, :rating, :apr, :logo, :icon, :website)
  end
end
