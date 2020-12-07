class Api::V1::ContactMethodsController <  Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_contact_method, only: [:show, :update, :destroy]

  # GET /contact_methods
  # GET /contact_methods.json
  def index
    @contact_methods = ContactMethod.all
  end

  # GET /contact_methods/1
  # GET /contact_methods/1.json
  def show
  end

  # POST /contact_methods
  # POST /contact_methods.json
  def create
    @contact_method = ContactMethod.new(contact_method_params)

    if @contact_method.save
      render :show, status: :created, location: @contact_method
    else
      render json: @contact_method.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contact_methods/1
  # PATCH/PUT /contact_methods/1.json
  def update
    if @contact_method.update(contact_method_params)
      render :show, status: :ok, location: @contact_method
    else
      render json: @contact_method.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contact_methods/1
  # DELETE /contact_methods/1.json
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
