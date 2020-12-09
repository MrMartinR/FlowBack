class Api::V1::ContactMethodsController <  Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_contact_method, only: [:show, :update, :destroy]

  def index
    @contact_methods = ContactMethod.includes(:contact).order('created_at desc').
      paginate(page: params[:page],per_page: params[:per_page])
  end

  def show
  end

  def create
    @contact_method = ContactMethod.new(contact_method_params)

    if @contact_method.save
      render :show, status: :created
    else
      json_response({success: false,message: @contact_method.errors}, :unprocessable_entity)
    end
  end

  def update
    if @contact_method.update(contact_method_params)
      render :show, status: :ok
    else
      json_response({success: false,message: @contact_method.errors}, :unprocessable_entity)
    end
  end

  def destroy
    @contact_method.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_method
      @contact_method = ContactMethod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_method_params
      params.require(:contact_method).permit(:contact_id, :created_by, :updated_by, :kind, :visibility, :data, :notes)
    end
end
