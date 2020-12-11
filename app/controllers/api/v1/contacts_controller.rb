class Api::V1::ContactsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    page = params[:page] || 1
    # im not sure if user_id column is related with user tables
    # if @user.is_admin? || @user.is_contributor?
    #   @contacts = Contact.all.paginate(page: page,per_page: params[:per_page])
    # else
    #   @contacts = Contact.where(user_id: @user.id).
    #     paginate(page: page,per_page: params[:per_page])
    # end
    @contacts = Contact.includes(:user,:country).paginate(page: page,per_page: params[:per_page])
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render :show, status: :ok
    else
      json_response({success: false,message: @contact.errors}, :unprocessable_entity)
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    if @contact.update(contact_params)
      render :show, status: :ok
    else
      json_response({success: false,message: @contact.errors}, :unprocessable_entity)
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      merged_params = {updated_by: @user.id}
      merged_params = {created_by: @user.id} if params[:action] == "create"

      params.require(:contact).permit(:country_id, :user_id, :kind, :visibility,
                                      :category, :header, :name, :surname,
                                      :trade_name_nick, :founded,
                                      :description, :legal_form, :tags, :id_number, :image).
        merge(merged_params)
    end
end
