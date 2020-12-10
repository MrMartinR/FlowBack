class Api::V1::OriginatorsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :admin_or_contributor!#, except: :index
  before_action :set_originator, only: [:show, :update, :destroy]


  def index
    if params[:page].blank?
      @originators = Originator.order('created_at asc')
    else
      @originators = Originator.order('created_at asc').paginate(page: params[:page],per_page: params[:per_page])
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
      json_response({success: false,message: @originator.errors}, :unprocessable_entity)
    end
  end

  def update
    if @originator.update(originator_params)
      render :show, status: :ok
    else
      json_response({success: false,message: @originator.errors}, :unprocessable_entity)
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
    merged_params = {updated_by: @user.id}
    merged_params = {created_by: @user.id} if params[:action] == "create"

    params.require(:originator).permit(:name, :product_type_individuals,
                                       :product_type_companies, :length,
                                       :default_rate, :air, :xirr, :rating,
                                       :apr, :logo, :icon, :website).merge(merged_params)
  end
end
