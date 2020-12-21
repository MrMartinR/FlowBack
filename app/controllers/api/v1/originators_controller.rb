class Api::V1::OriginatorsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :admin_or_contributor!, except: :index
  before_action :set_originator, only: %i[show update destroy]
  def index
    @originators = Originator.order('created_at asc')
  end

  def show; end

  def create
    @originator = Originator.new(originator_params)

    if @originator.save
      render :show, status: :created
    else
      json_response({ success: false, message: @originator.errors }, :unprocessable_entity)
    end
  end

  def update
    if @originator.update(originator_params)
      render :show, status: :ok
    else
      json_response({ success: false, message: @originator.errors }, :unprocessable_entity)
    end
  end

  # DELETE /originators/1
  # DELETE /originators/1.json
  def destroy
    if @originator.destroy
      json_response({ success: true, message: 'Originator deleted' })
    else
      json_response({ success: false, message: @originator.errors }, :unprocessable_entity)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_originator
    @originator = Originator.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def originator_params
    merged_params = { updated_by: @user.id }
    merged_params = { created_by: @user.id } if params[:action] == 'create'

    params.require(:originator).permit(
      :product_category_consumer,
      :product_category_business,
      :apr,
      :contact_id,
      :customer_category
    ).merge(merged_params)
  end
end
